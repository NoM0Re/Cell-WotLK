-- Locale cleanup implementation for fix_locales.lua.
--
-- This module intentionally has no third-party dependencies and remains compatible
-- with Lua 5.1. It treats locale assignments as byte ranges, so retained content
-- keeps its original whitespace, indentation, line endings, and encoding.

local M = {}

local pathSeparator = package.config:sub(1, 1)
local isWindows = pathSeparator == "\\"

local function normalizePath(path)
  return (path:gsub("\\", "/"):gsub("/+", "/"))
end

local function nativePath(path)
  if isWindows then
    return (path:gsub("/", "\\"))
  end
  return (path:gsub("\\", "/"))
end

local function joinPath(left, right)
  return nativePath(normalizePath(left) .. "/" .. normalizePath(right))
end

local function shellQuote(value)
  if isWindows then
    return '"' .. value:gsub('"', '""') .. '"'
  end
  return "'" .. value:gsub("'", "'\\''") .. "'"
end

local function readFile(path)
  local file, err = io.open(path, "rb")
  if not file then
    return nil, err
  end
  local content = file:read("*all")
  file:close()
  return content
end

local function writeFile(path, content)
  local file, err = io.open(path, "wb")
  if not file then
    return nil, err
  end
  local ok, writeErr = file:write(content)
  if not ok then
    file:close()
    return nil, writeErr
  end
  local closeOk, closeErr = file:close()
  if not closeOk then
    return nil, closeErr
  end
  return true
end

local function countNewlines(text, first, last)
  local count = 0
  local position = first
  while position <= last do
    local newline = text:find("\n", position, true)
    if not newline or newline > last then
      break
    end
    count = count + 1
    position = newline + 1
  end
  return count
end

local function longBracketLevel(text, position)
  if text:sub(position, position) ~= "[" then
    return nil
  end
  local cursor = position + 1
  while text:sub(cursor, cursor) == "=" do
    cursor = cursor + 1
  end
  if text:sub(cursor, cursor) == "[" then
    return cursor - position - 1, cursor
  end
  return nil
end

local shortEscapeValues = {
  a = "\a",
  b = "\b",
  f = "\f",
  n = "\n",
  r = "\r",
  t = "\t",
  v = "\v",
  ["\\"] = "\\",
  ['"'] = '"',
  ["'"] = "'",
}

local function readShortString(text, position, line)
  local quote = text:sub(position, position)
  local cursor = position + 1
  local value = {}
  local length = #text

  while cursor <= length do
    local character = text:sub(cursor, cursor)
    if character == quote then
      return {
        type = "string",
        value = table.concat(value),
        start = position,
        finish = cursor,
        line = line,
        endLine = line + countNewlines(text, position, cursor),
      }, cursor + 1
    elseif character == "\\" then
      local escaped = text:sub(cursor + 1, cursor + 1)
      if escaped == "" then
        return nil, nil, "unfinished escape sequence"
      elseif shortEscapeValues[escaped] then
        value[#value + 1] = shortEscapeValues[escaped]
        cursor = cursor + 2
      elseif escaped == "\n" then
        value[#value + 1] = "\n"
        cursor = cursor + 2
      elseif escaped == "\r" then
        value[#value + 1] = "\n"
        if text:sub(cursor + 2, cursor + 2) == "\n" then
          cursor = cursor + 3
        else
          cursor = cursor + 2
        end
      elseif escaped == "z" then
        cursor = cursor + 2
        while text:sub(cursor, cursor):match("%s") do
          cursor = cursor + 1
        end
      elseif escaped == "x" and text:sub(cursor + 2, cursor + 3):match("^%x%x$") then
        value[#value + 1] = string.char(tonumber(text:sub(cursor + 2, cursor + 3), 16))
        cursor = cursor + 4
      elseif escaped:match("%d") then
        local digits = text:match("^(%d%d?%d?)", cursor + 1)
        local number = tonumber(digits)
        if not number or number > 255 then
          return nil, nil, "invalid decimal escape sequence"
        end
        value[#value + 1] = string.char(number)
        cursor = cursor + 1 + #digits
      else
        -- Lua 5.1 accepts several historical escape forms in addon sources.
        -- Keeping the escaped byte is the least surprising comparison behavior.
        value[#value + 1] = escaped
        cursor = cursor + 2
      end
    else
      value[#value + 1] = character
      cursor = cursor + 1
    end
  end

  return nil, nil, "unfinished quoted string"
end

local function readLongString(text, position, line)
  local level, openerEnd = longBracketLevel(text, position)
  if level == nil then
    return nil
  end

  local closing = "]" .. string.rep("=", level) .. "]"
  local contentStart = openerEnd + 1
  local closingStart = text:find(closing, contentStart, true)
  if not closingStart then
    return nil, nil, "unfinished long string"
  end

  if text:sub(contentStart, contentStart + 1) == "\r\n" then
    contentStart = contentStart + 2
  elseif text:sub(contentStart, contentStart) == "\n" or text:sub(contentStart, contentStart) == "\r" then
    contentStart = contentStart + 1
  end

  local finish = closingStart + #closing - 1
  local value = text:sub(contentStart, closingStart - 1)
  -- Lua normalizes every physical newline inside long strings.
  value = value:gsub("\r\n", "\n"):gsub("\r", "\n")

  return {
    type = "string",
    value = value,
    start = position,
    finish = finish,
    line = line,
    endLine = line + countNewlines(text, position, finish),
  }, finish + 1
end

local function lex(text, filename)
  local tokens = {}
  local position = 1
  local line = 1
  local length = #text

  while position <= length do
    local character = text:sub(position, position)
    if character == " " or character == "\t" or character == "\f" or character == "\v" then
      position = position + 1
    elseif character == "\r" then
      if text:sub(position + 1, position + 1) == "\n" then
        position = position + 2
      else
        position = position + 1
      end
      line = line + 1
    elseif character == "\n" then
      position = position + 1
      line = line + 1
    elseif text:sub(position, position + 1) == "--" then
      local level, openerEnd = longBracketLevel(text, position + 2)
      if level ~= nil then
        local closing = "]" .. string.rep("=", level) .. "]"
        local closingStart = text:find(closing, openerEnd + 1, true)
        if not closingStart then
          return nil, string.format("%s:%d: unfinished long comment", filename, line)
        end
        local finish = closingStart + #closing - 1
        line = line + countNewlines(text, position, finish)
        position = finish + 1
      else
        local newline = text:find("[\r\n]", position + 2)
        position = newline or (length + 1)
      end
    elseif character == '"' or character == "'" then
      local token, nextPosition, err = readShortString(text, position, line)
      if not token then
        return nil, string.format("%s:%d: %s", filename, line, err)
      end
      tokens[#tokens + 1] = token
      line = token.endLine
      position = nextPosition
    elseif character == "[" and longBracketLevel(text, position) ~= nil then
      local token, nextPosition, err = readLongString(text, position, line)
      if not token then
        return nil, string.format("%s:%d: %s", filename, line, err)
      end
      tokens[#tokens + 1] = token
      line = token.endLine
      position = nextPosition
    elseif character:match("[%a_]") then
      local finish = position + 1
      while text:sub(finish, finish):match("[%w_]") do
        finish = finish + 1
      end
      tokens[#tokens + 1] = {
        type = "identifier",
        value = text:sub(position, finish - 1),
        start = position,
        finish = finish - 1,
        line = line,
        endLine = line,
      }
      position = finish
    else
      tokens[#tokens + 1] = {
        type = "symbol",
        value = character,
        start = position,
        finish = position,
        line = line,
        endLine = line,
      }
      position = position + 1
    end
  end

  return tokens
end

M.lex = lex

local function isToken(token, tokenType, value)
  return token and token.type == tokenType and (value == nil or token.value == value)
end

local function isKnownSafeDynamicReference(tokens, index)
  -- GetFactionInfoByID already returns a localized client string.
  if isToken(tokens[index + 2], "identifier", "GetFactionInfoByID") then
    return true
  end

  -- Some existing code computes a display string from a literal locale entry
  -- and then indexes L again. The inner literal is the only locale definition
  -- that can be checked or retained statically.
  local depth = 1
  local cursor = index + 2
  while cursor <= #tokens and depth > 0 do
    if isToken(tokens[cursor], "identifier", "L")
      and isToken(tokens[cursor + 1], "symbol", "[")
      and isToken(tokens[cursor + 2], "string")
      and isToken(tokens[cursor + 3], "symbol", "]")
    then
      return true
    elseif isToken(tokens[cursor], "symbol", "[") then
      depth = depth + 1
    elseif isToken(tokens[cursor], "symbol", "]") then
      depth = depth - 1
    end
    cursor = cursor + 1
  end
  return false
end

local function findLocaleReferences(text, filename)
  local tokens, err = lex(text, filename)
  if not tokens then
    return nil, nil, err
  end

  local references = {}
  local dynamic = {}
  for index = 1, #tokens - 3 do
    if isToken(tokens[index], "identifier", "L") and isToken(tokens[index + 1], "symbol", "[") then
      if isToken(tokens[index + 2], "string") and isToken(tokens[index + 3], "symbol", "]") then
        references[#references + 1] = {
          key = tokens[index + 2].value,
          line = tokens[index].line,
        }
      elseif not isKnownSafeDynamicReference(tokens, index) then
        dynamic[#dynamic + 1] = {
          line = tokens[index].line,
        }
      end
    end
  end
  return references, dynamic
end

M.findLocaleReferences = findLocaleReferences

local function findStringLiterals(text, filename)
  local tokens, err = lex(text, filename)
  if not tokens then
    return nil, err
  end

  local strings = {}
  for _, token in ipairs(tokens) do
    if token.type == "string" then
      strings[#strings + 1] = {
        key = token.value,
        line = token.line,
      }
    end
  end
  return strings
end

M.findStringLiterals = findStringLiterals

local function lineStart(text, position)
  local cursor = position - 1
  while cursor > 0 and text:sub(cursor, cursor) ~= "\n" and text:sub(cursor, cursor) ~= "\r" do
    cursor = cursor - 1
  end
  return cursor + 1
end

local function lineFinish(text, position)
  local length = #text
  local cursor = position + 1
  while cursor <= length do
    local character = text:sub(cursor, cursor)
    if character == "\r" then
      if text:sub(cursor + 1, cursor + 1) == "\n" then
        return cursor + 1
      end
      return cursor
    elseif character == "\n" then
      return cursor
    end
    cursor = cursor + 1
  end
  return length
end

local function includeAttachedTranslationMarker(text, startPosition)
  if startPosition <= 1 then
    return startPosition
  end

  local previousLineFinish = startPosition - 1
  local cursor = previousLineFinish - 1
  if text:sub(cursor, cursor) == "\r" and text:sub(previousLineFinish, previousLineFinish) == "\n" then
    cursor = cursor - 1
  end
  while cursor > 0 and text:sub(cursor, cursor) ~= "\n" and text:sub(cursor, cursor) ~= "\r" do
    cursor = cursor - 1
  end
  local previousLineStart = cursor + 1
  local previousLine = text:sub(previousLineStart, previousLineFinish)
  if previousLine:sub(-2) == "\r\n" then
    previousLine = previousLine:sub(1, -3)
  elseif previousLine:sub(-1) == "\r" or previousLine:sub(-1) == "\n" then
    previousLine = previousLine:sub(1, -2)
  end
  if previousLine:match("^%s*%-%-%[%[Translation missing %-%-%]%]%s*$") then
    return previousLineStart
  end
  return startPosition
end

local function parseLocaleAssignments(text, filename)
  local tokens, err = lex(text, filename)
  if not tokens then
    return nil, err
  end

  local assignments = {}
  local index = 1
  while index <= #tokens - 5 do
    if isToken(tokens[index], "identifier", "L")
      and isToken(tokens[index + 1], "symbol", "[")
      and isToken(tokens[index + 2], "string")
      and isToken(tokens[index + 3], "symbol", "]")
      and isToken(tokens[index + 4], "symbol", "=")
      and not isToken(tokens[index + 5], "symbol", "=")
    then
      local valueToken = tokens[index + 5]
      if not isToken(valueToken, "string")
        and not isToken(valueToken, "identifier", "true")
        and not isToken(valueToken, "identifier", "false")
      then
        return nil, string.format("%s:%d: locale value must be one string, true, or false", filename, tokens[index].line)
      end

      local assignmentLineStart = lineStart(text, tokens[index].start)
      local prefix = text:sub(assignmentLineStart, tokens[index].start - 1)
      if prefix:find("[^ \t]") then
        return nil, string.format("%s:%d: locale assignment must start on its own line", filename, tokens[index].line)
      end
      local startPosition = includeAttachedTranslationMarker(text, assignmentLineStart)

      local lastTokenIndex = index + 5
      if isToken(tokens[lastTokenIndex + 1], "symbol", ";") and tokens[lastTokenIndex + 1].line == valueToken.endLine then
        lastTokenIndex = lastTokenIndex + 1
      end
      local nextToken = tokens[lastTokenIndex + 1]
      if nextToken and nextToken.line == tokens[lastTokenIndex].endLine then
        if isToken(nextToken, "symbol", ".") and isToken(tokens[lastTokenIndex + 2], "symbol", ".") then
          -- Composite strings such as changelog HTML cannot be removed as one
          -- assignment without parsing the complete expression. Keep them.
          index = index + 1
        else
          return nil, string.format("%s:%d: locale assignment must end on its own line", filename, tokens[index].line)
        end
      else
        assignments[#assignments + 1] = {
          key = tokens[index + 2].value,
          line = tokens[index].line,
          start = startPosition,
          finish = lineFinish(text, tokens[lastTokenIndex].finish),
        }
        index = lastTokenIndex + 1
      end
    else
      index = index + 1
    end
  end

  return assignments
end

M.parseLocaleAssignments = parseLocaleAssignments

local function parseLocaleDefinitions(text, filename)
  local tokens, err = lex(text, filename)
  if not tokens then
    return nil, err
  end

  local definitions = {}
  for index = 1, #tokens - 3 do
    if isToken(tokens[index], "symbol", "[")
      and isToken(tokens[index + 1], "string")
      and isToken(tokens[index + 2], "symbol", "]")
      and isToken(tokens[index + 3], "symbol", "=")
    then
      definitions[#definitions + 1] = {
        key = tokens[index + 1].value,
        line = tokens[index].line,
      }
    end
  end
  return definitions
end

M.parseLocaleDefinitions = parseLocaleDefinitions

local function cleanLocaleContent(text, filename, usedKeys)
  local assignments, err = parseLocaleAssignments(text, filename)
  if not assignments then
    return nil, nil, err
  end

  local removed = {}
  local output = {}
  local cursor = 1
  for _, assignment in ipairs(assignments) do
    if not usedKeys[assignment.key] then
      output[#output + 1] = text:sub(cursor, assignment.start - 1)
      cursor = assignment.finish + 1
      removed[#removed + 1] = assignment
    end
  end
  output[#output + 1] = text:sub(cursor)

  return table.concat(output), removed, nil, assignments
end

M.cleanLocaleContent = cleanLocaleContent

local function gitFileList(root)
  local command = "git -C " .. shellQuote(nativePath(root))
    .. " ls-files -co --exclude-standard"
  if isWindows then
    command = command .. " 2>nul"
  else
    command = command .. " 2>/dev/null"
  end

  local pipe, err = io.popen(command, "r")
  if not pipe then
    return nil, err
  end
  local files = {}
  local seen = {}
  for line in pipe:lines() do
    local path = normalizePath(line)
    if not seen[path] then
      seen[path] = true
      files[#files + 1] = path
    end
  end
  local ok = pipe:close()
  if ok == nil or ok == false then
    return nil, "git ls-files failed; run this script from a Git working tree"
  end
  table.sort(files)
  return files
end

local function isTargetLocaleFile(path)
  return path:match("^Cell/Locales/[^/]+%.lua$")
    and not path:match("/enUS%.lua$")
end

local function isDefinitionLocaleFile(path)
  return path:match("^Cell/Locales/[^/]+%.lua$") ~= nil
end

local function isProtectedLocaleFile(path)
  local basename = path:match("([^/]+)$") or path
  return basename:lower():match("^zlocales.*%.lua$") ~= nil
end

local function isSourceFile(path)
  if not path:match("%.lua$") then
    return false
  end
  if not path:match("^Cell/") then
    return false
  end
  if path == "Cell/Utilities/BattleRes.lua"
    or path == "Cell/Utilities/QuickAssist.lua"
    or path == "Cell/Utilities/QuickAssist_Config.lua"
    or path == "Cell/Utilities/QuickAssist_ImportExport.lua"
    or path == "Cell/Utilities/QuickCast.lua"
  then
    return false
  end
  return not path:match("^Cell/Locales/")
    and not path:match("^Cell/Libs/")
    and not path:match("^Cell/Tools/")
    and not path:match("^Cell/%.snippets/")
end

local function keyDisplay(key)
  return '"' .. key
    :gsub("\\", "\\\\")
    :gsub("\r", "\\r")
    :gsub("\n", "\\n")
    :gsub("\t", "\\t")
    :gsub('"', '\\"') .. '"'
end

local function resolveRoot(candidate)
  local command = "git -C " .. shellQuote(nativePath(candidate)) .. " rev-parse --show-toplevel"
  if isWindows then
    command = command .. " 2>nul"
  else
    command = command .. " 2>/dev/null"
  end
  local pipe = io.popen(command, "r")
  if not pipe then
    return nil, "could not run git"
  end
  local root = pipe:read("*l")
  local ok = pipe:close()
  if not root or ok == nil or ok == false then
    return nil, "could not find the repository root from " .. candidate
  end
  return nativePath(root)
end

M.resolveRoot = resolveRoot

function M.run(options)
  options = options or {}
  local output = options.output or print
  local root = assert(options.root, "root is required")
  local dryRun = options.dryRun or options.check

  local files, listErr = gitFileList(root)
  if not files then
    return nil, listErr
  end

  local sourceFiles = {}
  local targetLocaleFiles = {}
  local definitionLocaleFiles = {}
  for _, path in ipairs(files) do
    if isSourceFile(path) then
      sourceFiles[#sourceFiles + 1] = path
    elseif isDefinitionLocaleFile(path) then
      definitionLocaleFiles[#definitionLocaleFiles + 1] = path
      if isTargetLocaleFile(path) then
        targetLocaleFiles[#targetLocaleFiles + 1] = path
      end
    end
  end
  if #targetLocaleFiles == 0 then
    return nil, "no translated locale files found in Cell/Locales"
  end

  local usedKeys = {}
  local dynamicReferences = {}
  for _, path in ipairs(sourceFiles) do
    local content, readErr = readFile(joinPath(root, path))
    if not content then
      return nil, path .. ": " .. tostring(readErr)
    end
    local references, dynamic, parseErr = findLocaleReferences(content, path)
    if not references then
      return nil, parseErr
    end
    local strings, stringErr = findStringLiterals(content, path)
    if not strings then
      return nil, stringErr
    end
    for _, literal in ipairs(strings) do
      usedKeys[literal.key] = true
    end
    for _, reference in ipairs(dynamic) do
      dynamicReferences[#dynamicReferences + 1] = {
        path = path,
        line = reference.line,
      }
    end
  end

  local parsedLocales = {}
  local protectedCount = 0
  for _, path in ipairs(definitionLocaleFiles) do
    local content, readErr = readFile(joinPath(root, path))
    if not content then
      return nil, path .. ": " .. tostring(readErr)
    end
    local assignments, parseErr = parseLocaleAssignments(content, path)
    if not assignments then
      return nil, parseErr
    end
    local target = isTargetLocaleFile(path) and true or false
    local customLocale = isProtectedLocaleFile(path)
    local protected = target and customLocale
    if protected and target then
      protectedCount = protectedCount + 1
    end
    parsedLocales[#parsedLocales + 1] = {
      path = path,
      content = content,
      assignments = assignments,
      protected = protected,
      target = target,
    }
  end

  local keysToKeep = {}
  for key in pairs(usedKeys) do
    keysToKeep[key] = true
  end

  local changes = {}
  local removedCount = 0
  for _, locale in ipairs(parsedLocales) do
    if locale.target and not locale.protected then
      local cleaned, removed, cleanErr = cleanLocaleContent(locale.content, locale.path, keysToKeep)
      if not cleaned then
        return nil, cleanErr
      end
      if #removed > 0 then
        changes[#changes + 1] = {
          path = locale.path,
          content = cleaned,
          removed = removed,
        }
        removedCount = removedCount + #removed
      end
    end
  end

  for _, change in ipairs(changes) do
    for _, assignment in ipairs(change.removed) do
      output(string.format("REMOVED %s:%d %s", change.path, assignment.line, keyDisplay(assignment.key)))
    end
  end

  for _, reference in ipairs(dynamicReferences) do
    output(string.format("WARNING dynamic locale reference at %s:%d cannot be checked", reference.path, reference.line))
  end

  if not dryRun then
    for _, change in ipairs(changes) do
      local ok, writeErr = writeFile(joinPath(root, change.path), change.content)
      if not ok then
        return nil, change.path .. ": " .. tostring(writeErr)
      end
    end
  end

  local usedCount = 0
  for _ in pairs(usedKeys) do
    usedCount = usedCount + 1
  end

  local result = {
    sourceFileCount = #sourceFiles,
    localeFileCount = #targetLocaleFiles,
    definitionLocaleFileCount = #definitionLocaleFiles,
    protectedFileCount = protectedCount,
    usedKeyCount = usedCount,
    changedFileCount = #changes,
    removedCount = removedCount,
    dynamicCount = #dynamicReferences,
    dryRun = dryRun and true or false,
    checkFailed = options.check and removedCount > 0 or false,
  }

  output("")
  output(string.format(
    "Summary: %d source files, %d used strings, %d target locale files (%d protected), %d definition locale files, %d removable entries in %d changed files, %d dynamic references.",
    result.sourceFileCount,
    result.usedKeyCount,
    result.localeFileCount,
    result.protectedFileCount,
    result.definitionLocaleFileCount,
    result.removedCount,
    result.changedFileCount,
    result.dynamicCount
  ))
  if dryRun then
    output("No files were changed.")
  elseif #changes == 0 then
    output("No locale files needed changes.")
  else
    output("Locale files were updated.")
  end

  return result
end

return M
