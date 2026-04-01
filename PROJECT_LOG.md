## Context
- Branch uses Debian-based image flow, not Ubuntu version tags.

## Target
- Build and publish Debian 13 image to GHCR from branch updates.

## Validation
- `git diff origin/master -- v24.04/Dockerfile.multiarch` shows no differences.
- `vdebian13/Dockerfile.multiarch` uses `dhi.io/debian-base:*` as build/runtime base.
- `vdebian13` now has `overlay` scripts wired via `ADD overlay /` and entrypoint/server wrappers.

## Problems
- No blockers, status open.

## To Be Done
- Confirm workflow can publish packages with repository permissions.
- Run one branch push and validate `debian13` tags in GHCR.

## References
- `.github/workflows/ghcr-build-push.yml`
- `vdebian13/Dockerfile.multiarch`
- `vdebian13/overlay/usr/bin/entrypoint`
- `vdebian13/overlay/usr/bin/server`
- `vdebian13/overlay/usr/bin/healthcheck`
- `v24.04/Dockerfile.multiarch`
- `CHANGELOG.md`
