# Agent Guide: Cell WotLK

## Scope

This repository is NoM0Re's authorized backport of enderneko's Cell addon for
World of Warcraft 3.3.5a (`Interface: 30300`, Lua 5.1).

The goal is upstream Cell behavior on Wrath, not a separate product direction.
Keep changes small, easy to compare with upstream, and limited to compatibility
work unless the maintainer explicitly requests a new feature.

## Permission And Attribution

`PERMISSION.md` is authoritative. Always preserve these conditions:

- The addon and top-level addon folder remain `Cell`.
- Credit to original author enderneko remains intact.
- Existing backport attribution to NoM0Re remains intact.
- The backport is not distributed for official Blizzard retail servers.
- Do not imply that the authorization grants rights to anyone besides NoM0Re.
- Copyright in the original Cell code remains with enderneko.
- NoM0Re's copyright notice covers only original backport modifications and
  additions authored by NoM0Re; it does not claim ownership of upstream Cell.

The permission grant in `PERMISSION.md` is the legal record. Do not rewrite its
substantive terms, broaden it into a public license, or describe it as a transfer
of copyright. Do not edit `LICENSE`, `PERMISSION.md`, author metadata, or
distribution wording without an explicit request consistent with that grant.

## Sources Of Truth

Use these references in order:

1. Upstream Cell for design, saved-data shape, names, and behavior. Fetch a
   temporary comparison copy into `.agents-cache/` when a concrete comparison
   is needed; do not commit downloaded Cell trees.
2. `APIDocumentation/Documentation` for the local 3.3.5a API surface.
3. The 3.3.5a FrameXML sources under
   `.agents-cache/3.3.5-interface-files-main` for secure/UI behavior.
4. Existing scoped implementations in `Cell/Compatibility.lua` and Wrath files.

`.agents-cache/` is local, ignored reference storage only. It may contain API
sources, downloaded archives, or temporary comparison repositories, but none of
it is part of the project or release. Do not copy broad compatibility layers or
replace a working local implementation without understanding the behavioral
difference.

## Runtime And Load Order

- `Cell/Cell.toc` is the runtime entry point.
- XML loaders are sequential dependencies, not module manifests.
- Check the TOC and relevant XML loader before adding, moving, or removing a file.
- Prefer an existing Wrath-specific file such as `Core_Wrath.lua`,
  `UnitButton_Cata_Wrath.lua`, `Defaults/*_Wrath.lua`, or `*_WotLK.lua`.
- Files excluded by `.pkgmeta` are development sources and must not become
  runtime dependencies.

## Porting Rules

- Preserve upstream structure, control flow, names, option keys, and saved-data
  layout wherever Wrath permits it.
- Use Lua 5.1 syntax and documented 3.3.5a event payloads.
- Keep compatibility helpers scoped to Cell. Do not add global API shims.
- Use old APIs directly when they are a clear equivalent; use the narrowest
  existing `F.*` helper when behavior needs adaptation.
- Remove `BackdropTemplate` from frame creation instead of replacing it with a
  global shim or a `nil` template argument.
- Secure snippets, state drivers, click-casting, and combat-lockdown code must
  be checked against local FrameXML before editing.
- Do not call unavailable modern methods behind feature probes. A Wrath
  implementation exists because those methods are absent.

Established scoped compatibility includes:

- `F.C_Timer` and cancellable timer handles
- `F.PixelUtil`
- `F.UnitGroupRolesAssigned` through bundled group-talent libraries
- `F.*` cooldown rendering and stop-motion/flipbook renderers
- atlas-to-texture mapping through `F.GetTextureInfo` and `F.SetTexture`
- mask-free progress and action rendering
- DBM encounter callbacks dispatched through Cell's callback system
- LibHealComm, LibResComm, and SpecializedAbsorbs integration

Do not recreate `C_*`, `PixelUtil`, `C_Timer`, mask, atlas, or cooldown globals.

## Editing

- Match surrounding style and avoid broad formatting churn.
- Preserve semicolons where upstream uses them; do not add them gratuitously.
- Add comments only for non-obvious compatibility behavior.
- Do not edit bundled libraries, generated media, locale data, or raid-debuff
  datasets unless the task specifically requires it.
- User-facing text must use the existing localization pattern.
- Never discard unrelated work from a dirty worktree.

## Repository Maintenance

- `.pkgmeta` defines the user-facing release archive.
- `.agents-cache/` is never committed or packaged. Use it only for disposable
  downloaded references and agent metadata.
- Development tools and snippets remain outside the release package.
- Locale cleanup lives in `.github/scripts/fix_locales`; run it in `--dry-run`
  mode before applying removals and review every dynamic-key warning.
- Do not add a second porting-notes document. Stable compatibility knowledge
  belongs here or next to the implementation that requires it.

## Diagnostics And Tooling

Luacheck/LuaRocks and the GitHub Actions lint workflow are the validation
priority.

- `.luacheckrc` is used by Luacheck and GitHub Actions.
- Do not install Lua or LuaRocks into this repository. They belong in their
  normal user or system locations.
- If `lua` or `luarocks` is missing from `PATH`, ask before making persistent
  user or system `PATH` changes. Session-local `PATH` changes are acceptable.
- If LuaRocks installed `luacheck` but it is not available on `PATH`, expose
  the maintainer's LuaRocks user binary directory for the current PowerShell
  session:

```powershell
$env:PATH = "$env:APPDATA\luarocks\bin;$env:PATH"
```

Then verify and run the repository check:

```powershell
cmd /c "where lua && where luarocks && where luacheck"
cmd /c "luacheck . -q"
```

If `luacheck` is missing but `lua` and `luarocks` are available, install it in
the normal LuaRocks user location with `luarocks install luacheck`. If the local
toolchain differs from the workflow environment and matching it is not
practical, report that and treat the GitHub Actions result as authoritative.

## Validation

For relevant changes:

- Parse every modified Lua file with a Lua 5.1 compiler when available.
- Run `luacheck . -q` after exposing the LuaRocks binary directory on `PATH`.
- Treat the GitHub Actions lint workflow as authoritative when local tooling
  differs from its Lua 5.1 environment.
- Parse modified XML and verify every TOC/XML reference exists.
- Run `.github/scripts/fix_locales/tests/test-locale-cleaner.lua` after changing
  locale tooling.
- Compare behavioral changes with the matching upstream Cell file.
- State clearly which behavior still requires testing inside the 3.3.5a client.

The ideal result remains recognizably upstream Cell with only the compatibility
differences required by Wrath 3.3.5a.
