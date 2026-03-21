# Ubuntu Browser-Workstation Parity

Status: v2.3 Round B scaffold
Updated: 2026-03-21

## Purpose

This document defines the public parity target for the Ubuntu browser-workstation
lane against `mdc-mac-app`.

The goal is role parity, not implementation import. Ubuntu should expose the
same public workstation shape where it is family-general, while private
Apple-native logic remains local to `mdc-mac-app`.

## Public Parity Target

Ubuntu should align to the public-consumable workstation role visible in
`mdc-mac-app`:

- binder-native local workflow operation
- markdown-first editing and preview flow
- compile-first publish flow
- workflow and scheduling visibility
- local review surfaces for contacts, notes, tasks, and message-derived records
- browser-based operator entry rather than private desktop-native controls

Primary reference surfaces reviewed:

- `mdc-mac-app/Docs/version-roadmap.md`
- `mdc-mac-app/Docs/public-kernel-alignment.md`
- `mdc-mac-app/Docs/u_dos_mac_app_v_2_spec.md`

## Role Mapping

| `mdc-mac-app` public role | Ubuntu browser-workstation parity target | Boundary note |
| --- | --- | --- |
| Binder-native local workflow core | browser workstation opens binder-focused workflow views and setup story | workflow semantics still stay outside Ubuntu |
| Markdown editor and preview | browser-hosted editor/preview shell is an expected workstation lane | Ubuntu owns workstation hosting, not editor semantics |
| Compile-first publishing | browser workstation routes publish tasks toward Wizard and shared render surfaces | Wizard stays owner of publish control plane |
| Schedule and job visibility | workstation surfaces schedule status and background-work handoff expectations | Ubuntu does not own scheduler policy |
| Local review for contacts, notes, mail-derived records | workstation provides review-oriented browser views and launch points | Apple-local acquisition stays private to `mdc-mac-app` |
| Runtime index acceleration | workstation may consume derived summaries and queue state | SQLite/runtime-index internals stay app-local where private |

## Explicit Non-Goals

Ubuntu Round B does not import or recreate:

- Apple Mail acquisition
- Apple Contacts integration
- Apple Notes, Calendar, or Reminders bridges
- macOS-native Swift UI or app-local SQLite implementation details
- private automation intelligence not yet promoted into public contracts

## Ubuntu Workstation Scaffold

The Ubuntu scaffold for Round B is intentionally browser-first and binder-native:

- browser shell is the primary workstation surface
- setup flow starts from Ubuntu first-run and lands in a workstation home view
- workstation home links to workflow, review, publish, automation, and diagnostics views
- the scaffold is represented as a checked-in manifest example for local operation planning

Scaffold artifact:

- `examples/browser-workstation-scaffold.json`

Demo entry:

- `bash scripts/demo-browser-workstation.sh`

## Expected User Flow

1. Sonic installs or boots the Ubuntu image.
2. Ubuntu first-run applies package, profile, and browser-workstation defaults.
3. The operator enters the browser workstation home view.
4. From the workstation shell, the operator can open:
   - workflow view
   - publish view
   - review center
   - automation status
   - diagnostics and setup status
5. Wizard remains the managed control-plane sibling for publish, OK, and external integration work.

## Boundary Rule

Ubuntu owns the browser-workstation hosting lane, setup story, and first-run
alignment for public-family operation.

Ubuntu does not own:

- canonical runtime semantics
- managed MCP or OK policy
- private Apple-native acquisition logic
- hidden scheduler logic that diverges from shared family workflow contracts
