---
name: NASM build artifacts must be gitignored
description: Why assembled binaries keep reappearing in commits and how to keep them out
---

# Keep assembled binaries out of the repo

Every Makefile program target (e.g. `dinghy`, `hello_repl`, `add`) produces an
extension-less ELF executable plus a `.o`. These must be listed by name in
`.gitignore` (the `.o` files are covered by `*.o`, but the binaries have no
extension so each program name needs its own line).

**Why:** The Replit workspace auto-commits filesystem changes on its own. If you
build a binary during verification and it is not gitignored, the auto-commit
silently re-adds it to the PR — even after you `git rm --cached` it once. This
caused repeated "binary checked into repo" review feedback.

**How to apply:** When adding a new Makefile program, add its binary name to
`.gitignore` in the same change. Run `make <prog>` then `git status` and confirm
no binary shows up before committing.
