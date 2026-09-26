# Git identity

Always commit as the repository's configured Git user. Do not override it.

## Rule

Run plain `git commit` (plus flags like `-S` for signing when the repo
requires it). Never pass `-c user.name=...` or `-c user.email=...`.

Before the first commit in a session, confirm the identity is right:

```sh
git config user.name && git config user.email
```

If either is empty, ask the user rather than inventing a value.

## Why

Overriding the identity produces commits attributed to a placeholder
author, which misattributes work and breaks `git shortlog`, `git blame`
and release-note generation. The repository and global Git config are
already correct; the only thing to do is not fight them.

## Related

- If a commit fails because the GPG keyring or agent is locked or
  unavailable, stop and ask the user to unlock it. Do not retry in a loop,
  and do not fall back to `--no-gpg-sign` unless the user explicitly says
  to. Never change `commit.gpgsign` in any config.
- Push with `--force-with-lease`, never `--force`.
- Never commit `local.properties`, keystores, signing credentials or
  build output.
