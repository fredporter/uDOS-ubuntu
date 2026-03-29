#!/usr/bin/env bash

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SHARED_PYTHON_BIN="${UDOS_SHARED_PYTHON_BIN:-}"
USE_SHARED_RESOURCES="${UDOS_USE_SHARED_RESOURCES:-1}"
PYTHON_BIN="${PYTHON:-python3}"

require_file() {
  if [ ! -f "$1" ]; then
    echo "missing required file: $1" >&2
    exit 1
  fi
}

cd "$REPO_ROOT"

if [ "$USE_SHARED_RESOURCES" = "1" ] && [ -z "$SHARED_PYTHON_BIN" ]; then
  FAMILY_HELPER="$REPO_ROOT/../scripts/lib/family-python.sh"
  if [ -f "$FAMILY_HELPER" ]; then
    # shellcheck source=/dev/null
    . "$FAMILY_HELPER"
    ensure_shared_python
    SHARED_PYTHON_BIN="${UDOS_SHARED_PYTHON_BIN:-}"
  fi
fi
if [ -n "$SHARED_PYTHON_BIN" ] && [ -x "$SHARED_PYTHON_BIN" ]; then
  PYTHON_BIN="$SHARED_PYTHON_BIN"
fi

require_file "$REPO_ROOT/README.md"
require_file "$REPO_ROOT/CHANGELOG.md"
require_file "$REPO_ROOT/docs/architecture.md"
require_file "$REPO_ROOT/docs/boundary.md"
require_file "$REPO_ROOT/docs/getting-started.md"
require_file "$REPO_ROOT/docs/examples.md"
require_file "$REPO_ROOT/docs/activation.md"
require_file "$REPO_ROOT/docs/browser-workstation-parity.md"
require_file "$REPO_ROOT/docs/browser-workstation-setup.md"
require_file "$REPO_ROOT/docs/google-mvp-runtime-mode.md"
require_file "$REPO_ROOT/build/README.md"
require_file "$REPO_ROOT/config/README.md"
require_file "$REPO_ROOT/config/packages.list"
require_file "$REPO_ROOT/proton/README.md"
require_file "$REPO_ROOT/proton/install.sh"
require_file "$REPO_ROOT/theming/README.md"
require_file "$REPO_ROOT/boot/README.md"
require_file "$REPO_ROOT/sonic-hooks/preinstall.sh"
require_file "$REPO_ROOT/sonic-hooks/postinstall.sh"
require_file "$REPO_ROOT/sonic-hooks/live-env.sh"
require_file "$REPO_ROOT/examples/autoinstall-example.yaml"
require_file "$REPO_ROOT/examples/proton-profile.env"
require_file "$REPO_ROOT/examples/thinui-c64-launch.json"
require_file "$REPO_ROOT/examples/browser-workstation-scaffold.json"
require_file "$REPO_ROOT/examples/google-mvp-host-profile.json"
require_file "$REPO_ROOT/examples/README.md"
require_file "$REPO_ROOT/scripts/README.md"
require_file "$REPO_ROOT/scripts/demo-first-run-setup.sh"
require_file "$REPO_ROOT/scripts/demo-browser-workstation.sh"
require_file "$REPO_ROOT/tests/README.md"
require_file "$REPO_ROOT/docs/first-run-story.md"

"$PYTHON_BIN" - <<'PY'
import json
from pathlib import Path

repo_root = Path(".").resolve()
packages = (repo_root / "config" / "packages.list").read_text(encoding="utf-8").splitlines()
if not any(line.strip() and not line.startswith("#") for line in packages):
    raise SystemExit("config/packages.list must include at least one package entry")
google_mvp_host = json.loads((repo_root / "examples" / "google-mvp-host-profile.json").read_text(encoding="utf-8"))
if google_mvp_host.get("profile") != "always-on-local-mirror-cache-host":
    raise SystemExit("examples/google-mvp-host-profile.json profile must be always-on-local-mirror-cache-host")
if google_mvp_host.get("fallback_rules", {}).get("canonical_truth") != "local vault and family-owned extracted artifacts":
    raise SystemExit("examples/google-mvp-host-profile.json fallback_rules.canonical_truth must remain local-family-owned")
PY

if command -v rg >/dev/null 2>&1; then
  if rg -n '/Users/fredbook/Code|~/Users/fredbook/Code' \
    "$REPO_ROOT/README.md" \
    "$REPO_ROOT/docs" \
    "$REPO_ROOT/examples" \
    "$REPO_ROOT/config"; then
    echo "private local-root reference found in uDOS-ubuntu" >&2
    exit 1
  fi
else
  if grep -RInE -I --exclude-dir='__pycache__' '/Users/fredbook/Code|~/Users/fredbook/Code' \
    "$REPO_ROOT/README.md" \
    "$REPO_ROOT/docs" \
    "$REPO_ROOT/examples" \
    "$REPO_ROOT/config"; then
    echo "private local-root reference found in uDOS-ubuntu" >&2
    exit 1
  fi
fi

echo "uDOS-ubuntu checks passed"
