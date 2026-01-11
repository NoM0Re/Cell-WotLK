# Contributing to Cell

This repository is a WotLK 3.3.5a compatibility port of upstream [Cell](https://github.com/enderneko/Cell). The goal is to stay as close as practical to upstream while making Cell work correctly on WotLK.

Contributions should focus on:

- Bug fixes for this WotLK port.
- WotLK 3.3.5a compatibility fixes.
- Porting existing upstream Cell behavior where the WotLK API allows it.
- Documentation updates for this repository.

If a feature does not exist in upstream Cell, propose it upstream first. This repository does not accept port-only custom features.

## Code Standards

- Keep all Lua compatible with Lua 5.1 and the WoW 3.3.5a addon environment.
- Keep changes close to upstream Cell in structure, naming, saved data, and behavior.
- Verify API-sensitive changes against the local `APIDocumentation` reference.
- Use `L["Some text"]` for user-facing strings and add locale entries consistently.
- Avoid semicolons in new code. Preserve existing semicolons where they help comparison with upstream.
- Do not rewrite bundled libraries, generated data, or media unless the change specifically requires it.
- Keep compatibility helpers scoped to Cell. Do not add missing Retail APIs to the global namespace.
- Add release notes to `CHANGELOG.md` under a heading that exactly matches the intended tag.

## Pull Requests

Please open or join an issue before working on a non-trivial change. Pull requests are easiest to review when they contain one focused fix and explain any unavoidable difference from upstream.

1. [Fork](https://github.com/NoM0Re/Cell-WotLK/fork) this repository.
2. Create a branch from `main`.

   ```bash
   git checkout -b my-topic-branch
   ```

3. Implement and test the change on a WotLK 3.3.5a client.
4. Run the available Lua checks and ensure the TOC/XML load order remains valid.
5. Commit and push your branch.

   ```bash
   git commit -a -m "Describe the change"
   git push
   ```

6. [Open a pull request](https://github.com/NoM0Re/Cell-WotLK/pulls) with clear reproduction and testing details.

## Keeping a Fork Updated

```bash
git remote add upstream https://github.com/NoM0Re/Cell-WotLK.git
git fetch upstream
git checkout main
git rebase upstream/main
```

Rebase your topic branch onto the updated `main` branch before requesting another review.

## Reporting Issues

Search the [issue tracker](https://github.com/NoM0Re/Cell-WotLK/issues) before opening a report. If no matching issue exists, use the provided bug-report template and include:

- Cell version and client locale.
- Server or client extension in use.
- Reproduction steps.
- Lua errors and screenshots when available.
- Whether the issue also occurs with only Cell enabled.
- A Cell profile export or `Cell.lua` SavedVariables file when relevant.

Feature requests should concern existing upstream Cell behavior that needs to be ported or compatibility work required to make that behavior function on WotLK 3.3.5a.
