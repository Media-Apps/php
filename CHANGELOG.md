# Changelog

## 2025-04-15

* Added
  * Add Ubuntu 22.04 with Freexian PHP 7.4

## 2023-08-18

* Added
  * ImageMagic-7 via imei.sh for heic support

## 2020-05-25

* Added
  * Add Ubuntu 20.04 with php 7.4

## 2019-10-18

* Added
  * Install composer for dep management

## 2019-10-16

* Changed
  * Switch to single branch development
  * Use drone starlark instead of yaml
  * Prepare multi architecture support

## 2019-10-15

* Added
  * Properly log proxied remote IPs

## 2019-04-17

* Added
  * Install current samba from Sernet

## 2018-10-08

* Fixed
  * Fixed entrypoint script exit
  * Fixed listening port within vhost
* Added
  * Ensure entrypoint is loaded

## 2018-09-26

* Added
  * Integrate clair vuln checks

## 2018-09-25

* Added
  * Initial version

### Iteration 2026-04-01 10:31 UTC
- Context: Add GitHub Actions delivery for the pushed feature branch.
- Target: Build and push versioned Docker images to GHCR from this branch.
- Actions log: Added GHCR workflow with matrix builds for v20.04, v22.04, and v24.04.
- Actions log: Added `PROJECT_LOG.md` with required structure and references.
- Validation: `git status --short --branch` run; workflow and log files are present.
- Validation: Result pass; branch is tracking origin with new local modifications only.
- Problems: None identified, status open.
- To Be Done: Push this commit and verify Actions run and package publish permissions.
- References: `.github/workflows/ghcr-build-push.yml`, `PROJECT_LOG.md`, `CHANGELOG.md`

### Iteration 2026-04-01 10:33 UTC
- Context: Align branch artifacts with Debian-based image flow.
- Target: Publish only Debian image tags and keep Ubuntu 24.04 file untouched.
- Actions log: Updated GHCR workflow to build from `vdebian13` and publish `debian13` tags.
- Actions log: Added `vdebian13/Dockerfile.multiarch` for Debian 13 PHP 7.4 FPM image.
- Actions log: Updated README tags section for `debian13` GHCR image.
- Validation: `git diff origin/master -- v24.04/Dockerfile.multiarch` returned empty output.
- Validation: Result pass; `v24.04/Dockerfile.multiarch` matches original state.
- Problems: None identified, status open.
- To Be Done: Commit and push branch updates, then verify GHCR package publish in Actions.
- References: `.github/workflows/ghcr-build-push.yml`, `vdebian13/Dockerfile.multiarch`, `CHANGELOG.md`

### Iteration 2026-04-01 10:40 UTC
- Context: Remove confusing `php:8.x` base usage in Debian Dockerfile.
- Target: Use Debian base images directly while keeping PHP 7.4 build flow.
- Actions log: Switched builder/runtime `FROM` to `dhi.io/debian-base:trixie-dev` and `:trixie`.
- Actions log: Updated runtime user from `nonroot` to `www-data` for Debian base compatibility.
- Validation: `rg "dhi.io/php:8\\.|FROM \\$\\{DHI_.*IMAGE\\}" vdebian13/Dockerfile.multiarch`.
- Validation: Result pass; no `dhi.io/php:8.x` base remains in Debian Dockerfile.
- Problems: None identified, status open.
- To Be Done: Run CI build to validate runtime user and shared library compatibility.
- References: `vdebian13/Dockerfile.multiarch`, `CHANGELOG.md`

### Iteration 2026-04-01 10:45 UTC
- Context: Keep Debian image structure aligned with original overlay philosophy.
- Target: Move runtime launch/config glue to overlay scripts for `vdebian13`.
- Actions log: Added `vdebian13/overlay/usr/bin/{entrypoint,server,healthcheck}` scripts.
- Actions log: Added `vdebian13/overlay/etc/entrypoint.d/99-php-fpm.sh` init script.
- Actions log: Updated Debian Dockerfile to `ADD overlay /` and use entrypoint/server commands.
- Validation: `git status --short --branch` and `ReadLints` checks.
- Validation: Result pass; overlay files detected and no linter diagnostics.
- Problems: None identified, status open.
- To Be Done: Run image build in CI and optionally add Docker `HEALTHCHECK` instruction.
- References: `vdebian13/overlay`, `vdebian13/Dockerfile.multiarch`, `CHANGELOG.md`
