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

- **GitHub contract** (documented family-wide in `uDOS-dev/@dev/notes/roadmap/v2-family-roadmap.md` § Engineering backlog): what Actions run on **`main`**, which sibling repos are checked out for governance/contracts, and that **`promote.yml` is not part of this repo’s contract**. CI must stay aligned with the scripts below—avoid duplicating logic in YAML only.
- **Local source of truth:** your **clone of this repo** on the Ubuntu host plus **`~/.udos/`** materialised by `scripts/lib/runtime-layout.sh` and the `udos-*` host scripts. Operators and contributors treat **green `run-ubuntu-checks.sh` + `verify-command-centre-http.sh` on real hardware** as the ground truth; GitHub is a **mirror** of those entrypoints on `ubuntu-latest`.
