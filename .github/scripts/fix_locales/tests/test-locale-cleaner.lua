local function normalizePath(path)
  return (path:gsub("\\", "/"):gsub("/+", "/"))
end

local scriptPath = normalizePath(arg[0] or ".github/scripts/fix_locales/tests/test-locale-cleaner.lua")
local testDirectory = scriptPath:match("^(.*)/[^/]+$") or "."
local cleaner = dofile(testDirectory .. "/../locale-cleaner.lua")

local testCount = 0

local function test(name, callback)
  local ok, err = pcall(callback)
  if not ok then
    io.stderr:write("FAIL " .. name .. "\n" .. tostring(err) .. "\n")
    os.exit(1)
  end
  testCount = testCount + 1
  print("PASS " .. name)
end

local function assertEqual(actual, expected, message)
  if actual ~= expected then
    error((message or "values differ") .. "\nexpected: " .. string.format("%q", expected) .. "\nactual:   " .. string.format("%q", actual), 2)
  end
end

test("finds escaped and long-string keys but ignores comments and strings", function()
  local source = [==[
local L = Cell.L
L["line\nbreak"] = true
L[ [=[long
key]=] ] = true
-- L["comment"] = true
local example = 'L["inside a string"]'
]==]
  local references, dynamic, err = cleaner.findLocaleReferences(source, "source.lua")
  assert(not err, err)
  assertEqual(#references, 2)
  assertEqual(references[1].key, "line\nbreak")
  assertEqual(references[2].key, "long\nkey")
  assertEqual(#dynamic, 0)
end)

test("reports dynamic locale table access", function()
  local references, dynamic, err = cleaner.findLocaleReferences('return L[key] or L["known"]\n', "source.lua")
  assert(not err, err)
  assertEqual(#references, 1)
  assertEqual(references[1].key, "known")
  assertEqual(#dynamic, 1)
  assertEqual(dynamic[1].line, 1)
end)

test("accepts the two intentional computed locale lookups", function()
  local source = table.concat({
    'local faction = L[GetFactionInfoByID(309) or ""]',
    'local count = L[string.format(L["%s total auras"], 42)]',
    "",
  }, "\n")
  local references, dynamic, err = cleaner.findLocaleReferences(source, "source.lua")
  assert(not err, err)
  assertEqual(#references, 1)
  assertEqual(references[1].key, "%s total auras")
  assertEqual(#dynamic, 0)
end)

test("removes only unused assignment bytes and preserves CRLF formatting", function()
  local source = table.concat({
    "local L = Cell.L",
    "",
    "if locale == \"deDE\" then",
    "--[[Translation missing --]]",
    "\tL[\"keep\"] = \"Behalten\"",
    "\t--[[Translation missing --]]",
    "\tL[\"remove\"] = \"Entfernen\"",
    "\tL[ [=[keep",
    "long]=] ] = [=[Mehrzeilig",
    "behalten]=]",
    "end",
    "",
  }, "\r\n")
  local expected = table.concat({
    "local L = Cell.L",
    "",
    "if locale == \"deDE\" then",
    "--[[Translation missing --]]",
    "\tL[\"keep\"] = \"Behalten\"",
    "\tL[ [=[keep",
    "long]=] ] = [=[Mehrzeilig",
    "behalten]=]",
    "end",
    "",
  }, "\r\n")
  local cleaned, removed, err = cleaner.cleanLocaleContent(source, "deDE.lua", {
    keep = true,
    ["keep\nlong"] = true,
  })
  assert(not err, err)
  assertEqual(cleaned, expected)
  assertEqual(#removed, 1)
  assertEqual(removed[1].key, "remove")
  assertEqual(removed[1].line, 7)
end)

test("returns byte-identical content when every key is used", function()
  local source = "local L = Cell.L\n  L[\"kept\"] = \"spacing stays\"\n"
  local cleaned, removed, err = cleaner.cleanLocaleContent(source, "enUS.lua", { kept = true })
  assert(not err, err)
  assertEqual(cleaned, source)
  assertEqual(#removed, 0)
end)

test("recognizes direct Cell.L references", function()
  local references, dynamic, err = cleaner.findLocaleReferences('return Cell.L["shared"]\n', "module.lua")
  assert(not err, err)
  assertEqual(#references, 1)
  assertEqual(references[1].key, "shared")
  assertEqual(#dynamic, 0)
end)

test("collects strings used by dynamic locale lookups", function()
  local strings, err = cleaner.findStringLiterals('local choices = { "Tank", "Healer" }\nreturn L[choices[1]]\n', "module.lua")
  assert(not err, err)
  assertEqual(#strings, 2)
  assertEqual(strings[1].key, "Tank")
  assertEqual(strings[2].key, "Healer")
end)

test("finds keys in the English locale table", function()
  local definitions, err = cleaner.parseLocaleDefinitions('return { ["first"] = "First",\n[ [=[second]=] ] = true }\n', "enUS.lua")
  assert(not err, err)
  assertEqual(#definitions, 2)
  assertEqual(definitions[1].key, "first")
  assertEqual(definitions[2].key, "second")
end)

test("parses a guarded zLocales fallback as one definition", function()
  local source = table.concat({
    'if L["Fallback"] == nil then',
    '  L["Fallback"] = "Fallback"',
    "end",
    "",
  }, "\n")
  local assignments, err = cleaner.parseLocaleAssignments(source, "zLocales.lua")
  assert(not err, err)
  assertEqual(#assignments, 1)
  assertEqual(assignments[1].key, "Fallback")
  assertEqual(assignments[1].line, 2)
end)

test("rejects assignments sharing a line with other Lua code", function()
  local source = "L[\"unsafe\"] = \"value\"; print(\"do not delete me\")\n"
  local cleaned, removed, err = cleaner.cleanLocaleContent(source, "unsafe.lua", {})
  assertEqual(cleaned, nil)
  assertEqual(removed, nil)
  assert(err and err:match("must end on its own line"), err)
end)

test("preserves concatenations continued on another line", function()
  local source = 'L["unused"] = "one"\n  .. "two"\nL["keep"] = "kept"\n'
  local cleaned, removed, err = cleaner.cleanLocaleContent(source, "continued.lua", {keep = true})
  assert(not err, err)
  assertEqual(cleaned, source)
  assertEqual(#removed, 0)
end)

test("preserves trailing multiline comments with their assignment", function()
  local source = 'L["unused"] = "one" --[=[ note\ncomment continues\n]=]\nL["keep"] = "kept"\n'
  local cleaned, removed, err = cleaner.cleanLocaleContent(source, "comment.lua", {keep = true})
  assert(not err, err)
  assertEqual(cleaned, source)
  assertEqual(#removed, 0)
end)

local blacklistKey = "Added |T%d:0|t|cFFFF3030%s(%d)|r into debuff blacklist."
local fixedBlacklistKey = "Added |T%s:0|t|cFFFF3030%s(%d)|r into debuff blacklist."
local blacklistTranslations = {
  deDE = "|T%d:0|t|cFFFF3030%s(%d)|r zur Blockliste der Debuffs hinzugefügt.",
  esES = "Añadido |T%d:0|t|cFFFF3030%s(%d)|r a la lista negra de perjuicios.",
  esMX = "Añadido |T%d:0|t|cFFFF3030%s(%d)|r a la lista negra de perjuicios.",
  frFR = "Ajout de |T%d:0|t|cFFFF3030%s(%d)|r dans la liste noire des affaiblissements.",
  itIT = "Aggiunto |T%d:0|t|cFFFF3030%s(%d)|r nella blacklist dei debuff.",
  koKR = "|T%d:0|t|cFFFF3030%s(%d)|r 디버프 블랙리스트에 추가됨.",
  ptBR = "Você adicionou |T%d:0|t|cFFFF3030%s(%d)|r na lista negra de debuffs.",
  ruRU = "Добавленно |T%d:0|t|cFFFF3030%s(%d)|r в чёрный список дебаффов.",
  zhCN = "已将 |T%d:0|t|cFFFF3030%s(%d)|r 添加至减益黑名单。",
  zhTW = "已將 |T%d:0|t|cFFFF3030%s(%d)|r 加入減益黑名單。",
}

test("fixes fresh upstream blacklist entries in every translation without changing spell IDs", function()
  for locale, translation in pairs(blacklistTranslations) do
    local source = '\tL["' .. blacklistKey .. '"]  =  "' .. translation .. '"; -- keep\r\n'
    local expected = source:gsub("|T%%d:0|t", "|T%%s:0|t")
    local fixed, corrected, err = cleaner.fixLocaleContent(source, "Cell/Locales/" .. locale .. ".lua")
    assert(not err, err)
    assertEqual(fixed, expected, locale)
    assertEqual(#corrected, 1)
    local assignments = assert(cleaner.parseLocaleAssignments(fixed, locale .. ".lua"))
    assert(assignments[1].valueToken.value:format("Interface\\Icons\\Spell_Holy_Heal", "Heal", 2050))
    local repeated, repeatedCorrections = cleaner.fixLocaleContent(fixed, locale .. ".lua")
    assertEqual(repeated, fixed)
    assertEqual(#repeatedCorrections, 0)
  end
end)

test("fixes only the blacklist icon in matching keys, including partial imports", function()
  local source = table.concat({
    '-- L["' .. blacklistKey .. '"] = "|T%d:0|t"',
    'L["other"] = "|T%d:0|t (%d)"',
    "L['" .. blacklistKey .. "'] = true",
    'L[ [=[' .. fixedBlacklistKey .. ']=] ] = [=[|T%d:0|t %s(%d)]=]',
    "",
  }, "\n")
  local expected = table.concat({
    '-- L["' .. blacklistKey .. '"] = "|T%d:0|t"',
    'L["other"] = "|T%d:0|t (%d)"',
    "L['" .. fixedBlacklistKey .. "'] = true",
    'L[ [=[' .. fixedBlacklistKey .. ']=] ] = [=[|T%s:0|t %s(%d)]=]',
    "",
  }, "\n")
  local fixed, corrected, err = cleaner.fixLocaleContent(source, "deDE.lua")
  assert(not err, err)
  assertEqual(fixed, expected)
  assertEqual(#corrected, 2)
end)

test("restores the two known missing translation arguments without replacing new wording", function()
  local cases = {
    {"ruRU", 'L["first %d"] = "первый(я)"', 'L["first %d"] = "первые %d"'},
    {"ptBR", 'L["Layout renamed: %s to %s."] = "Layout renomeado: %s."', 'L["Layout renamed: %s to %s."] = "Layout renomeado: %s para %s."'},
  }
  for _, case in ipairs(cases) do
    local fixed, corrected = cleaner.fixLocaleContent(case[2] .. "\r\n", "Cell\\Locales\\" .. case[1] .. ".lua")
    assertEqual(fixed, case[3] .. "\r\n")
    assertEqual(#corrected, 1)
    local repeated, changes = cleaner.fixLocaleContent(fixed, case[1] .. ".lua")
    assertEqual(repeated, fixed)
    assertEqual(#changes, 0)
    assertEqual(cleaner.fixLocaleContent(case[2], "deDE.lua"), case[2])
  end
  local future = 'L["first %d"] = "новые %d"\n'
  assertEqual(cleaner.fixLocaleContent(future, "ruRU.lua"), future)
  future = 'L["Layout renamed: %s to %s."] = "De %s para %s."\n'
  assertEqual(cleaner.fixLocaleContent(future, "ptBR.lua"), future)
end)

-- Run the real pipeline against an in-memory Git file list and filesystem.
local function withFiles(files, callback)
  -- luacheck: globals io.open io.popen
  local open, popen = io.open, io.popen
  io.popen = function()
    local names = {}
    for path in pairs(files) do names[#names + 1] = path end
    table.sort(names)
    local index = 0
    return {
      lines = function() return function() index = index + 1; return names[index] end end,
      close = function() return true end,
    }
  end
  io.open = function(path, mode)
    path = normalizePath(path):gsub("^fixture/", "")
    assert(files[path], "unexpected file: " .. path)
    return {
      read = function() assertEqual(mode, "rb"); return files[path] end,
      write = function(_, content) assertEqual(mode, "wb"); files[path] = content; return true end,
      close = function() return true end,
    }
  end
  local ok, err = pcall(callback)
  io.open, io.popen = open, popen
  assert(ok, err)
end

test("dry-run and check detect corrections alone, then apply is idempotent", function()
  local original = 'L["' .. blacklistKey .. '"] = "' .. blacklistTranslations.deDE .. '"\r\n'
  local files = {
    ["Cell/Test.lua"] = 'return L["' .. fixedBlacklistKey .. '"]\n',
    ["Cell/Locales/enUS.lua"] = original,
    ["Cell/Locales/zLocales.lua"] = original,
    ["Cell/Locales/deDE.lua"] = original,
  }
  withFiles(files, function()
    local logs = {}
    local function run(options)
      options.root = "fixture"
      options.output = function(line) logs[#logs + 1] = line end
      local result, err = cleaner.run(options)
      assert(result, err)
      return result
    end
    local result = run({dryRun = true})
    assertEqual(result.correctedCount, 1)
    assertEqual(result.removedCount, 0)
    assertEqual(result.changedFileCount, 1)
    assertEqual(files["Cell/Locales/deDE.lua"], original)
    assert(table.concat(logs, "\n"):find("CORRECTED Cell/Locales/deDE.lua:1", 1, true))
    assert(run({check = true}).checkFailed)
    assertEqual(files["Cell/Locales/deDE.lua"], original)
    run({})
    assertEqual(files["Cell/Locales/deDE.lua"], (original:gsub("|T%%d:0|t", "|T%%s:0|t")))
    assertEqual(files["Cell/Locales/enUS.lua"], original)
    assertEqual(files["Cell/Locales/zLocales.lua"], original)
    result = run({check = true})
    assertEqual(result.checkFailed, false)
    assertEqual(result.correctedCount, 0)
    assertEqual(result.changedFileCount, 0)
  end)
end)

print(string.format("\n%d tests passed.", testCount))
