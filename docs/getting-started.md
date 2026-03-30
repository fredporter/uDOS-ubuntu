# Getting Started

## Prerequisites

- Linux host for full image build path
- Bash and core GNU userland tools
- Python 3 for validation helper checks

## Quick Start

```bash
./scripts/run-ubuntu-checks.sh
```

This validates required repository surfaces and template assets.

## First-time Linux (public repo, full family litmus)

If this is a **fresh Linux machine** and you are cloning **`uDOS-ubuntu`** from GitHub (or similar) for the first time, use:

- **`docs/linux-first-run-quickstart.md`** — step-by-step and one-liner clone + bootstrap.
- **`scripts/linux-family-bootstrap.sh`** — installs common packages, clones `cursor-01` sibling repos, runs **`runtime-spine-round-proof.sh`**.

## Command-Centre Scaffold

Inspect the current scaffold manifest with:

```bash
cat examples/browser-workstation-scaffold.json
```

Emit the command-centre demo story with:

```bash
bash scripts/demo-browser-workstation.sh
```

Planning references:

- `docs/systemd-unit-plan.md`
- `docs/config-layout.md`
- `docs/local-service-scaffold.md`
