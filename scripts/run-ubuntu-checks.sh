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
require_file "$REPO_ROOT/docs/linux-first-run-quickstart.md"
require_file "$REPO_ROOT/docs/lan-command-centre-persistent.md"
require_file "$REPO_ROOT/docs/examples.md"
require_file "$REPO_ROOT/docs/activation.md"
require_file "$REPO_ROOT/docs/systemd-unit-plan.md"
require_file "$REPO_ROOT/docs/config-layout.md"
require_file "$REPO_ROOT/docs/local-service-scaffold.md"
require_file "$REPO_ROOT/docs/google-mvp-runtime-mode.md"
require_file "$REPO_ROOT/docs/docker-compose-compatibility.md"
require_file "$REPO_ROOT/scripts/verify-docker-compose-compatibility-doc.sh"
require_file "$REPO_ROOT/contracts/README.md"
require_file "$REPO_ROOT/contracts/udos-commandd/api-envelope.schema.json"
require_file "$REPO_ROOT/contracts/udos-commandd/operation-registry.v1.json"
require_file "$REPO_ROOT/contracts/udos-commandd/minimum-operations.v1.json"
require_file "$REPO_ROOT/contracts/udos-commandd/wizard-host-surface.v1.json"
require_file "$REPO_ROOT/contracts/udos-commandd/git-host-surface.v1.json"
require_file "$REPO_ROOT/contracts/udos-web/command-centre-static-demo.v1.json"
require_file "$REPO_ROOT/build/README.md"
require_file "$REPO_ROOT/config/README.md"
require_file "$REPO_ROOT/config/host/README.md"
require_file "$REPO_ROOT/config/host/budget-status.lane1.json"
require_file "$REPO_ROOT/config/host/providers.lane1.json"
require_file "$REPO_ROOT/config/packages.list"
require_file "$REPO_ROOT/config/policy/README.md"
require_file "$REPO_ROOT/config/policy/github-action-policy.json.example"
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
require_file "$REPO_ROOT/examples/thinui-ubuntu-gnome-launch.json"
require_file "$REPO_ROOT/examples/browser-workstation-scaffold.json"
require_file "$REPO_ROOT/examples/google-mvp-host-profile.json"
require_file "$REPO_ROOT/examples/README.md"
require_file "$REPO_ROOT/examples/command-centre-demo/index.html"
require_file "$REPO_ROOT/scripts/serve-command-centre-demo.sh"
require_file "$REPO_ROOT/scripts/lib/serve_static_http.py"
require_file "$REPO_ROOT/scripts/lane1-runtime-proof-tui.sh"
require_file "$REPO_ROOT/scripts/verify-command-centre-http.sh"
require_file "$REPO_ROOT/scripts/verify-command-centre-lan-continuity.sh"
require_file "$REPO_ROOT/scripts/lib/runtime_daemon_httpd.py"
require_file "$REPO_ROOT/scripts/lib/human_readable_demo.py"
require_file "$REPO_ROOT/scripts/verify-udos-runtime-daemons.sh"
require_file "$REPO_ROOT/scripts/runtime-spine-workspace-tui.sh"
require_file "$REPO_ROOT/scripts/runtime-spine-round-proof.sh"
require_file "$REPO_ROOT/scripts/linux-family-bootstrap.sh"
require_file "$REPO_ROOT/scripts/serve-command-centre-demo-lan.sh"
require_file "$REPO_ROOT/scripts/install-command-centre-demo-lan-user-service.sh"
require_file "$REPO_ROOT/scripts/run-ubuntu-strict-completion-gate.sh"
require_file "$REPO_ROOT/scripts/README.md"
require_file "$REPO_ROOT/scripts/demo-first-run-setup.sh"
require_file "$REPO_ROOT/scripts/demo-browser-workstation.sh"
require_file "$REPO_ROOT/scripts/lib/service-stub.sh"
require_file "$REPO_ROOT/scripts/lib/runtime-layout.sh"
require_file "$REPO_ROOT/scripts/lib/udos-web-listen.sh"
require_file "$REPO_ROOT/scripts/lib/verify-ubuntu-static-contracts.py"
require_file "$REPO_ROOT/scripts/udos-hostd.sh"
require_file "$REPO_ROOT/scripts/udos-commandd.sh"
require_file "$REPO_ROOT/scripts/udos_commandd.py"
require_file "$REPO_ROOT/scripts/udos-vaultd.sh"
require_file "$REPO_ROOT/scripts/udos-syncd.sh"
require_file "$REPO_ROOT/scripts/udos-gitd.sh"
require_file "$REPO_ROOT/scripts/udos-scheduled.sh"
require_file "$REPO_ROOT/scripts/udos-networkd.sh"
require_file "$REPO_ROOT/scripts/udos-budgetd.sh"
require_file "$REPO_ROOT/scripts/udos-web.sh"
require_file "$REPO_ROOT/scripts/udos-tuid.sh"
require_file "$REPO_ROOT/scripts/udos-thinui.sh"
require_file "$REPO_ROOT/scripts/udos-wizard-adapter.sh"
require_file "$REPO_ROOT/tests/README.md"
require_file "$REPO_ROOT/docs/first-run-story.md"
require_file "$REPO_ROOT/config/systemd/udos-hostd.service"
require_file "$REPO_ROOT/config/systemd/udos-commandd.service"
require_file "$REPO_ROOT/config/systemd/udos-vaultd.service"
require_file "$REPO_ROOT/config/systemd/udos-syncd.service"
require_file "$REPO_ROOT/config/systemd/udos-gitd.service"
require_file "$REPO_ROOT/config/systemd/udos-scheduled.service"
require_file "$REPO_ROOT/config/systemd/udos-networkd.service"
require_file "$REPO_ROOT/config/systemd/udos-budgetd.service"
require_file "$REPO_ROOT/config/systemd/udos-web.service"
require_file "$REPO_ROOT/config/systemd/udos-tuid.service"
require_file "$REPO_ROOT/config/systemd/udos-thinui.service"
require_file "$REPO_ROOT/config/systemd/udos-wizard-adapter.service"
require_file "$REPO_ROOT/config/env/udos.env.example"
require_file "$REPO_ROOT/config/env/udos-web.env.example"
require_file "$REPO_ROOT/config/env/udos-networkd.env.example"
require_file "$REPO_ROOT/config/env/udos-wizard-adapter.env.example"
require_file "$REPO_ROOT/config/runtime/runtime.yaml.example"
require_file "$REPO_ROOT/config/runtime/git-repos.yaml.example"
require_file "$REPO_ROOT/config/network/network.yaml.example"
require_file "$REPO_ROOT/config/publish/publish.yaml.example"

"$PYTHON_BIN" "$REPO_ROOT/scripts/lib/verify-ubuntu-static-contracts.py"

TMP_HOME="$(mktemp -d)"
trap 'rm -rf "$TMP_HOME"' EXIT
UDOS_HOME="$TMP_HOME/.udos" bash "$REPO_ROOT/scripts/udos-hostd.sh" layout-only >/dev/null
test -f "$TMP_HOME/.udos/state/hostd/runtime-layout.json"
test -d "$TMP_HOME/.udos/vault/inbox"
test -d "$TMP_HOME/.udos/sync/queue"
test -d "$TMP_HOME/.udos/state/web"
test -d "$TMP_HOME/.udos/repos"
UDOS_HOME="$TMP_HOME/.udos" bash "$REPO_ROOT/scripts/udos-gitd.sh" init-layout >/dev/null
UDOS_HOME="$TMP_HOME/.udos" bash "$REPO_ROOT/scripts/udos-gitd.sh" repo-list >/dev/null
UDOS_HOME="$TMP_HOME/.udos" bash "$REPO_ROOT/scripts/udos-gitd.sh" >/dev/null
UDOS_HOME="$TMP_HOME/.udos" bash "$REPO_ROOT/scripts/udos-commandd.sh" list-operations repo >/dev/null
UDOS_HOME="$TMP_HOME/.udos" "$REPO_ROOT/scripts/udos_commandd.py" list-operations repo >/dev/null
UDOS_HOME="$TMP_HOME/.udos" bash "$REPO_ROOT/scripts/udos-commandd.sh" surface-summary git >/dev/null
UDOS_HOME="$TMP_HOME/.udos" "$REPO_ROOT/scripts/udos_commandd.py" surface-summary git >/dev/null
UDOS_HOME="$TMP_HOME/.udos" bash "$REPO_ROOT/scripts/udos-commandd.sh" policy-summary >/dev/null
UDOS_HOME="$TMP_HOME/.udos" "$REPO_ROOT/scripts/udos_commandd.py" policy-summary >/dev/null
UDOS_HOME="$TMP_HOME/.udos" bash "$REPO_ROOT/scripts/udos-commandd.sh" repo-op repo.list >/dev/null
UDOS_HOME="$TMP_HOME/.udos" "$REPO_ROOT/scripts/udos_commandd.py" repo-op repo.list >/dev/null
repo_push_output="$(UDOS_HOME="$TMP_HOME/.udos" bash "$REPO_ROOT/scripts/udos-commandd.sh" repo-op repo.push uDOS-ubuntu || true)"
printf '%s' "$repo_push_output" | grep -q 'status=blocked'
github_gate_output="$(UDOS_HOME="$TMP_HOME/.udos" bash "$REPO_ROOT/scripts/udos-commandd.sh" repo-op github.pr.create uDOS-ubuntu || true)"
printf '%s' "$github_gate_output" | grep -q 'status=policy-gated'

if command -v rg >/dev/null 2>&1; then
  if rg -n '/Users/fredbook/Code|~/Users/fredbook/Code' \
    --glob '!.compost/**' \
    "$REPO_ROOT/README.md" \
    "$REPO_ROOT/docs" \
    "$REPO_ROOT/examples" \
    "$REPO_ROOT/config"; then
    echo "private local-root reference found in uDOS-ubuntu" >&2
    exit 1
  fi
else
  if grep -RInE -I --exclude-dir='__pycache__' --exclude-dir='.compost' '/Users/fredbook/Code|~/Users/fredbook/Code' \
    "$REPO_ROOT/README.md" \
    "$REPO_ROOT/docs" \
    "$REPO_ROOT/examples" \
    "$REPO_ROOT/config"; then
    echo "private local-root reference found in uDOS-ubuntu" >&2
    exit 1
  fi
fi

bash "$REPO_ROOT/scripts/verify-docker-compose-compatibility-doc.sh"
bash "$REPO_ROOT/scripts/verify-udos-runtime-daemons.sh"

echo "uDOS-ubuntu checks passed"
