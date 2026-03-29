# Binder Request: ubuntu-v2-3-google-host-mvp

binder: `#binder/ubuntu-v2-3-google-host-mvp`
round: `v2.3 Patch Round: Ubuntu Google host and fallback lane`
owner: `uDOS-ubuntu`
status: `open`
working tags: `@dev/ubuntu-google-host`, `@dev/google-sync-opportunity`

## Scope

Define the first Ubuntu-owned host, cache, and fallback assumptions for the
Google MVP lane.

Ubuntu should make the Google-backed lane operable without taking ownership of
provider orchestration or cloud-service semantics.

## Dependent Repos

- `uDOS-ubuntu`
- `uDOS-empire`
- `uDOS-wizard`
- `uDOS-gameplay`
- `uDOS-dev`

## Acceptance Criteria

- [ ] Ubuntu publishes the local host/runtime assumptions for the Google MVP lane
- [ ] cache, offline fallback, and local execution expectations are explicit
- [ ] docs clearly distinguish optional Google-backed services from the base Ubuntu runtime role
- [ ] repo-local `@dev` notes or upgrade materials exist for the targeted round

## Boundary Rules

- `uDOS-ubuntu` owns host runtime, local cache, fallback, and workstation/server assumptions
- `uDOS-wizard` owns provider access and prompt/orchestration entry
- `uDOS-empire` owns supervised remote-service lanes and sync/service policy
- Ubuntu does not become the owner of Google service semantics

## Today Round Target

- round brief: `uDOS-ubuntu/@dev/rounds/2026-03-24-google-host-mvp-round.md`
- default host profile:
  - `always-on local mirror/cache host`
- minimum expected outputs today:
  - explicit host profile and operator default
  - local cache and offline recovery rules
  - failure-mode note for unreachable Google services
  - separation between base Ubuntu runtime and optional Google-backed behavior
- validation:
  - `bash scripts/run-ubuntu-checks.sh`

## Lifecycle Checklist

- [x] Open
- [x] Hand off
- [x] Advance
- [ ] Review
- [ ] Commit
- [ ] Complete
- [ ] Compile
- [ ] Promote
