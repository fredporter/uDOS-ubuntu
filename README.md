# uDOS-ubuntu

## Purpose

Canonical Ubuntu 22.04 LTS base image definition for uDOS v2 deployments.

## Ownership

- reproducible base image definition and build flow
- sonic-screwdriver install hook compatibility
- Proton suite integration lane
- uDOS boot and desktop identity assets

## Non-Goals

- runtime semantics ownership
- replacing uDOS-core contracts
- full distro fork ownership

## Spine

- `build/`
- `config/`
- `proton/`
- `theming/`
- `boot/`
- `sonic-hooks/`
- `docs/`
- `scripts/`
- `tests/`
- `examples/`

## Local Development

Keep image generation deterministic, scriptable, and portable for Sonic-driven deploy.

## Family Relation

uDOS-ubuntu is the base OS lane consumed by sonic-screwdriver and layered by
uDOS-core, uDOS-shell, and family extensions.

## Activation

The v2 repo activation path is documented in docs/activation.md.

Run the local validation entrypoint with:

scripts/run-ubuntu-checks.sh

Run the current first-run demo story with:

```bash
bash scripts/demo-first-run-setup.sh
```
