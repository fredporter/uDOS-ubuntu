# Contracts

Machine-readable command-centre contracts for `uDOS-ubuntu`.

These files mirror the active Workspace 01 planning docs and exist so Cursor
handover can move directly into implementation without reinterpreting the prose
spec.

## Current Contract Set

- `udos-commandd/api-envelope.schema.json`
- `udos-commandd/library-surface.v1.json`
- `udos-commandd/operation-registry.v1.json`
- `udos-commandd/minimum-operations.v1.json`
- `udos-commandd/okd-surface.v1.json`
- `udos-commandd/wizard-host-surface.v1.json`

## Rule

Checked-in contract files should stay:

- versioned
- JSON-parseable
- aligned with the active docs under `../docs/`
- limited to current runtime-spine truths rather than historical alternatives
