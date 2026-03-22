# Submission: ubuntu-v2-3-browser-workstation-parity Round B Complete

binder: #binder/ubuntu-v2-3-browser-workstation-parity
round: v2.3 Round B: Ubuntu browser-workstation scaffold
owner: uDOS-ubuntu
status: complete
date: 2026-03-21

## Summary

Round B is complete.

- `uDOS-ubuntu` now defines the browser-first local workstation target without
  binding the public roadmap to a private app repo
- Ubuntu ships a browser-workstation scaffold manifest for binder-native local operation
- first-run, setup, activation, and examples docs are aligned to the browser-workstation direction
- private Apple-native behavior remains explicitly outside public-family ownership
- the Round C binder (`#binder/dev-v2-3-workflow-schedules`) is open

## Evidence

### uDOS-ubuntu

- `docs/browser-workstation-parity.md`
- `docs/browser-workstation-setup.md`
- `docs/first-run-story.md`
- `docs/activation.md`
- `docs/getting-started.md`
- `docs/architecture.md`
- `docs/examples.md`
- `examples/browser-workstation-scaffold.json`
- `scripts/demo-browser-workstation.sh`
- `scripts/demo-first-run-setup.sh`
- `scripts/run-ubuntu-checks.sh`

### Repo and Family Coordination

- `uDOS-ubuntu/@dev/requests/binder-ubuntu-v2-3-browser-workstation-parity.md`
- `uDOS-dev/@dev/requests/binder-dev-v2-3-workflow-schedules.md`
- `uDOS-dev/@dev/notes/roadmap/v2.3-rounds.md`
- `uDOS-dev/@dev/notes/roadmap/v2.3-unified-spec.md`

## Acceptance Criteria Check

- [x] workstation target is documented without binding the public roadmap to a private app repo
- [x] Ubuntu exposes a browser-workstation scaffold for binder-native local operation
- [x] first-run, setup, and workstation docs align with the new parity target
- [x] private Apple-native behavior remains outside public-family ownership
- [x] Round C binder opens with owner and acceptance criteria

## Validation

- `bash scripts/run-ubuntu-checks.sh` in `uDOS-ubuntu`
  - result: pass
- `bash scripts/demo-browser-workstation.sh` in `uDOS-ubuntu`
  - result: pass
- `bash scripts/demo-first-run-setup.sh` in `uDOS-ubuntu`
  - result: pass

## Boundary Check

- Ubuntu owns workstation hosting, setup story, and browser-first operator scaffolding
- Wizard remains the owner of managed publish, OK, and external integration control planes
- private Apple-native acquisition, Swift UI, and runtime-index internals remain outside public-family ownership

## Handoff

Advance to v2.3 Round C (`#binder/dev-v2-3-workflow-schedules`).
