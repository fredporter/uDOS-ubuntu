# uDOS-ubuntu Activation

## Purpose

Activate the first public base-image lane for the uDOS family with deterministic
build surfaces, sonic-compatible install hooks, and an always-on command-centre
setup direction.

## Activated Surfaces

- reproducible build lane under build/
- package and system defaults under config/
- sonic pre/post install hooks under sonic-hooks/
- command-centre scaffolding, service-boot planning, and config layout docs
- legacy-named scaffold manifest under examples/
- repo validation entrypoint under scripts/run-ubuntu-checks.sh

## Current Validation Contract

Run:

```bash
bash scripts/run-ubuntu-checks.sh
bash scripts/verify-command-centre-http.sh
```

The checks verify required repository surfaces, runtime daemon smoke, and the
command-centre HTTP marker.

## GitHub Actions

Workflows live under `.github/workflows/`:

| Workflow | Role |
| --- | --- |
| **`validate.yml`** | On **push/PR to `main`**: `run-ubuntu-checks.sh` + `verify-command-centre-http.sh` (self-contained on GitHub runners). |
| **`family-policy-check.yml`** | Same triggers: family **governance** file layout (`uDOS-dev` scripts) + **Core** `run-contract-enforcement.sh`. |

There is **no** `develop` branch or automated promote job; integration is **`main`**
only. Other family repos may still call reusable workflows from `uDOS-dev`; this
repo is the **reference** for a slimmer, `main`-first layout.

### GitHub contract vs local source of truth

- **Canonical contract:** sibling `uDOS-dev/docs/github-actions-family-contract.md` (clone layout `../uDOS-dev/docs/...` from this repo). Summary: **`main`-only** Actions, script-owned checks, **`promote.yml` not required** here; CI mirrors `run-ubuntu-checks.sh` + `verify-command-centre-http.sh`.
- **Engineering backlog pointer:** `uDOS-dev/@dev/notes/roadmap/v2-family-roadmap.md` § Engineering backlog (roll-forward for other repos).
- **Local source of truth:** your **clone of this repo** on the Ubuntu host plus **`~/.udos/`** materialised by `scripts/lib/runtime-layout.sh` and the `udos-*` host scripts. Operators treat **green checks on real hardware** as primary truth; GitHub is a **mirror** on `ubuntu-latest`.
