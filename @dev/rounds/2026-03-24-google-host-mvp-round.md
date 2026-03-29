# 2026-03-24 Ubuntu Google Host MVP Round

## Binder

- `#binder/ubuntu-v2-3-google-host-mvp`

## Objective

Define the Ubuntu-owned host, cache, fallback, and local runtime assumptions
for the first Google MVP lane.

## Named Host Profile

- `always-on local mirror/cache host`

## Today Deliverables

1. define the default operator-visible Ubuntu role for this MVP
2. state which execution paths stay local by default:
   - cache
   - artifact staging
   - recovery/replay
   - local handoff back into family-owned files
3. define fallback when Google-backed services are unreachable:
   - continue from local cache when possible
   - surface degraded mode to the operator
   - avoid treating remote mirrors as canonical
4. align the host profile to current workstation/server positioning
5. leave one repo-local closeout target under `@dev/submissions/`

## First Tasks

1. define the preferred Ubuntu role for the MVP
   - preferred start: always-on local mirror/cache host
2. state which runtime paths stay local even when Google-backed services are enabled
3. define fallback behavior when Google-backed services are unavailable
4. align the MVP against current Ubuntu workstation/server positioning

## First Files To Touch

- `@dev/decisions/always-on-server-model.md`
- `@dev/decisions/google-sync-opportunity.md`
- `@dev/v2-upgrade/uDOS-ubuntu/README.md`
- runtime docs once the host pattern is fixed

## Required Decisions

- whether the MVP is positioned first as:
  - workstation companion
  - always-on local server
  - both, with one named default
- what local cache is required
- what operator-visible failure mode should be documented

## Validation Path

- `bash scripts/run-ubuntu-checks.sh`
- keep demo/setup docs aligned with the chosen host role

## Evidence Targets

- `@dev/decisions/always-on-server-model.md`
- `@dev/decisions/google-sync-opportunity.md`
- `@dev/v2-upgrade/uDOS-ubuntu/README.md`
- runtime docs once the host pattern is fixed

## Done When

- Ubuntu has one explicit host/fallback pattern for the MVP
- optional Google-backed behavior is clearly separated from the base runtime
- implementation can begin without reopening host-ownership questions
- operator-visible degraded-mode behavior is documented
