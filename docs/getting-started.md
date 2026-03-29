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
