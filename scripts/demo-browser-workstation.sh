#!/usr/bin/env bash

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MANIFEST="$REPO_ROOT/examples/browser-workstation-scaffold.json"

echo "[uDOS-ubuntu] Browser workstation parity demo"
echo "1. Ubuntu first-run applies package and browser profile baseline"
echo "2. Browser workstation home opens as the binder-native operator surface"
echo "3. Workflow, review, publish, automation, and diagnostics views become the primary local lanes"
echo "4. Wizard remains the sibling control plane for publish, OK, and managed external integration"
echo ""
echo "[uDOS-ubuntu] Workstation scaffold manifest"
cat "$MANIFEST"
