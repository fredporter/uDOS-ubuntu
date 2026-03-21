# Browser Workstation Setup

Use this guide to stage the Round B Ubuntu browser-workstation scaffold for
local binder-native operation.

## Surfaces

The current scaffold assumes these operator lanes exist across the family:

- Ubuntu first-run and package baseline
- browser workstation home and panel navigation
- Wizard browser operator surfaces for workflow, publishing, automation, and config
- Shell quickstart and startup-health entrypoints

## Setup Story

1. Validate the Ubuntu repo:

```bash
bash scripts/run-ubuntu-checks.sh
```

2. Review the workstation scaffold manifest:

```bash
cat examples/browser-workstation-scaffold.json
```

3. Emit the local workstation demo story:

```bash
bash scripts/demo-browser-workstation.sh
```

4. If the Wizard sibling repo is available, pair the workstation shell with the
   active Wizard browser lanes:

```text
/app/workflow
/app/automation
/app/publishing
/app/config
```

## Workstation Home Expectations

The browser workstation home should expose:

- binder summary and active workspace context
- workflow status and current task lane
- review entrypoints for contacts, notes, tasks, and message-derived records
- publish handoff entrypoint
- automation and diagnostics status

## Public/Private Split

Use this scaffold to mirror public workstation roles only.

Do not infer that Ubuntu owns:

- Apple-local acquisition
- desktop-native review widgets from `mdc-mac-app`
- private SQLite schemas or Swift-only UI structure

## Current Round-B Deliverable

Round B provides:

- documented parity target
- checked-in workstation scaffold manifest
- demoable setup story
- first-run and activation docs aligned to the workstation direction

Later rounds may deepen the workstation shell into a fuller browser operator
product, but this round is specifically the public parity scaffold.
