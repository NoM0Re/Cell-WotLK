#!/usr/bin/env lua

-- Remove unused Cell locale entries without
-- reformatting the remaining content.

local function normalizePath(path)
  return (path:gsub("\\", "/"):gsub("/+", "/"))
end

local scriptPath = normalizePath(arg[0] or ".github/scripts/fix_locales/fix_locales.lua")
local scriptDirectory = scriptPath:match("^(.*)/[^/]+$") or "."
local cleaner = dofile(scriptDirectory .. "/locale-cleaner.lua")

local function usage()
  print([[
Usage:
  lua .github/scripts/fix_locales/fix_locales.lua [--dry-run | --check] [--root PATH]

Modes:
  (default)  Remove unused entries and print removed keys and dynamic lookups.
  --dry-run  Print what would be removed without changing files.
  --check    Like --dry-run, but exit with status 1 when cleanup is needed.

Notes:
  * Cell Lua sources are scanned while bundled libraries, tools, and snippets
    are ignored.
  * A translation is retained when its key occurs as any string literal in
    loaded Cell source. This also covers data translated through dynamic L[key].
  * Cell/Locales/enUS.lua supplies the fallback table and is never modified.
  * Locale files named zLocales*.lua are detected but never modified.
  * Dynamic L[...] lookups are reported for review even though their literal
    source values are retained by the conservative string scan.
  * Existing whitespace, indentation, line endings, and entry order are kept.
]])
end

local options = {}
local rootCandidate = scriptDirectory .. "/../../.."
local index = 1
while index <= #arg do
  local argument = arg[index]
  if argument == "--dry-run" then
    options.dryRun = true
  elseif argument == "--check" then
    options.check = true
  elseif argument == "--root" then
    index = index + 1
    if not arg[index] then
      io.stderr:write("Error: --root requires a path\n")
      os.exit(2)
    end
    rootCandidate = arg[index]
  elseif argument == "--help" or argument == "-h" then
    usage()
    os.exit(0)
  else
    io.stderr:write("Error: unknown argument " .. tostring(argument) .. "\n\n")
    usage()
    os.exit(2)
  end
  index = index + 1
end

if options.dryRun and options.check then
  io.stderr:write("Error: --dry-run and --check cannot be combined\n")
  os.exit(2)
end

local root, rootErr = cleaner.resolveRoot(rootCandidate)
if not root then
  io.stderr:write("Error: " .. tostring(rootErr) .. "\n")
  os.exit(2)
end
options.root = root

local result, err = cleaner.run(options)
if not result then
  io.stderr:write("Error: " .. tostring(err) .. "\n")
  os.exit(2)
end

if result.checkFailed then
  os.exit(1)
end
