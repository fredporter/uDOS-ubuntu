#!/usr/bin/env bash
# One entrypoint for round closure: HTTP GUI verification + full workspace TUI cycle.
# Passes through extra args to runtime-spine-workspace-tui.sh (none today; reserved).
#
# Usage:
#   bash scripts/runtime-spine-round-proof.sh

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[1/2] Command-centre HTTP (localhost GUI artefact)"
bash "$SCRIPT_DIR/verify-command-centre-http.sh"
echo ""
echo "[2/2] Workspace TUI cycle (all repos in cursor-01-runtime-spine)"
bash "$SCRIPT_DIR/runtime-spine-workspace-tui.sh" "$@"
echo ""
echo "runtime-spine-round-proof: all gates passed."
echo "  (See TUI sections \"Test-reporting rollup\" and \"Open development queue\" for pass vs still-open work.)"
