# Locale cleanup

After updating Cell's locale files, run:

```sh
lua .github/scripts/fix_locales/fix_locales.lua
```

The script scans Cell's loaded Lua sources and removes assignments from
translated files in `Cell/Locales` whose key no longer occurs as a string
literal anywhere in that code. This conservative rule also retains strings
that are translated indirectly through dynamic `L[value]` lookups. The English
fallback table is never modified.

Useful modes:

```sh
# Preview without writing files
lua .github/scripts/fix_locales/fix_locales.lua --dry-run

# CI-style check; exits with 1 when cleanup is needed
lua .github/scripts/fix_locales/fix_locales.lua --check

# Parser and formatting regression tests
lua .github/scripts/fix_locales/tests/test-locale-cleaner.lua
```

Dynamic `L[...]` lookups are reported for review. Bundled libraries, tools,
code snippets, and source files excluded from the release are not scanned.
Retained locale content keeps its original formatting and encoding.
