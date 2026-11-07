# Locale cleanup

After copying upstream locale files into `Cell/Locales`, preview the changes:

```sh
lua .github/scripts/fix_locales/fix_locales.lua --dry-run
```

The script first applies three targeted, repeatable placeholder corrections:

- The debuff-blacklist message's icon uses `%s` in both the English key and
  its translation: Wrath returns a texture file path. Its spell-ID `%d` stays.
- The known ruRU `first %d` translation regains its missing count.
- The known ptBR layout-rename translation regains its missing new name.

The latter two corrections match the exact old translation, preserving future
upstream wording changes. Other `%d` placeholders are never replaced globally.

The script then scans Cell's loaded Lua sources and removes assignments from
translated files in `Cell/Locales` whose key no longer occurs as a string
literal anywhere in that code. This conservative rule also retains strings
that are translated indirectly through dynamic `L[value]` lookups. The English
fallback table is never modified. Review the `CORRECTED`, `REMOVED`, and dynamic
lookup warnings, then run without `--dry-run` to apply the changes:

```sh
lua .github/scripts/fix_locales/fix_locales.lua
```

Useful modes:

```sh
# Preview without writing files
lua .github/scripts/fix_locales/fix_locales.lua --dry-run

# CI-style check; exits with 1 when corrections or removals are needed
lua .github/scripts/fix_locales/fix_locales.lua --check

# Parser and formatting regression tests
lua .github/scripts/fix_locales/tests/test-locale-cleaner.lua
```

Dynamic `L[...]` lookups are reported for review. Bundled libraries, tools,
code snippets, and source files excluded from the release are not scanned.
Retained locale content keeps its original formatting and encoding.
