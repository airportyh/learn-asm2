---
name: GitHub push auth in this repl
description: git CLI push and gitPush fail auth here; githubAPI proxy works
---
Raw `git push` to origin (HTTPS) fails auth, and the git-remote `gitPush` callback returns `NO_CREDENTIALS` ("repl-identity-token-unexpected-user") — the GitHub connection doesn't mint push credentials for this repl's identity.

**Why:** Observed July 17, 2026 while testing the PR flow; the `githubAPI` proxy WAS authenticated and worked fine.

**How to apply:** To get commits onto GitHub, use `githubAPI` (create ref, PUT contents or git-database blob/tree/commit, then open PR). Also: the durable CodeExecution scope has no `Buffer`/`btoa` — base64-encode inside a `"use impure"` function.
