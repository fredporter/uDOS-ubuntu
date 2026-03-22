# Binder Request: ubuntu-v2-3-browser-workstation-parity

binder: #binder/ubuntu-v2-3-browser-workstation-parity
round: v2.3 Round B: Ubuntu browser-workstation scaffold
owner: uDOS-ubuntu
status: complete
working tags: @dev/v2-3-ubuntu-workstation, @dev/v2-3-mdc-parity

## Scope

Scaffold the Ubuntu/browser workstation lane so it can deliver the browser-first
local workstation role without importing private macOS-native logic into the
public family.

## Dependent Repos

- uDOS-ubuntu
- uDOS-wizard
- uDOS-shell
- uDOS-dev

## Acceptance Criteria

- [x] workstation target is documented without binding the public roadmap to a private app repo
- [x] Ubuntu exposes a browser-workstation scaffold for binder-native local operation
- [x] first-run, setup, and workstation docs align with the new parity target
- [x] private Apple-native behavior remains outside public-family ownership
- [x] Round C binder is open with owner and acceptance criteria

## Lifecycle Checklist

- [x] Open
- [x] Hand off
- [x] Advance
- [x] Review
- [ ] Commit
- [x] Complete
- [x] Compile
- [ ] Promote
