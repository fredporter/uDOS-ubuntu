# Local Service Scaffold

This document defines the first runnable local scaffold for the Ubuntu
command-centre services.

## Purpose

The service wrappers in `scripts/` are not real daemons yet. They are starter
entrypoints that:

- load the expected service identity
- create the matching state/log directories under `~/.udos/`
- prove the naming and boot plan are coherent

## Current Stub Entry Points

- `scripts/udos-hostd.sh`
- `scripts/udos-commandd.sh`
- `scripts/udos-vaultd.sh`
- `scripts/udos-syncd.sh`
- `scripts/udos-scheduled.sh`
- `scripts/udos-networkd.sh`
- `scripts/udos-budgetd.sh`
- `scripts/udos-web.sh`
- `scripts/udos-tuid.sh`
- `scripts/udos-thinui.sh`
- `scripts/udos-wizard-adapter.sh`

Shared helper:

- `scripts/lib/service-stub.sh`

## Local Manual Run

Example:

```bash
bash scripts/udos-hostd.sh
bash scripts/udos-commandd.sh
bash scripts/udos-vaultd.sh
bash scripts/udos-web.sh
```

Each command should print:

- service id
- configured port
- `UDOS_HOME`
- state directory
- log directory
- `status=stub-ready`

## Current Scope

This scaffold does not yet:

- expose real HTTP APIs
- daemonize or long-run
- implement actual command routing
- implement vault, sync, schedule, or network logic

It exists to lock the service names, wrapper paths, and install assumptions
before deeper implementation begins.

## Next Layer

The next implementation inputs now live in the checked-in machine-readable
contracts:

- `contracts/udos-commandd/api-envelope.schema.json`
- `contracts/udos-commandd/operation-registry.v1.json`
- `contracts/udos-commandd/minimum-operations.v1.json`

These should be treated as the handover bridge between the Workspace 01 docs
and the first real `udos-commandd` implementation pass.
