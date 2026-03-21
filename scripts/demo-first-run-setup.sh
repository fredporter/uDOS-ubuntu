#!/usr/bin/env bash

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
THINUI_DEMO="$REPO_ROOT/../uDOS-thinui/scripts/demo-thinui.js"

echo "[uDOS-ubuntu] First-run setup story"
echo "1. Sonic stages Ubuntu image and hooks"
echo "2. Ubuntu applies base package and desktop profile"
echo "3. Browser workstation home becomes the binder-native operator shell"
echo "4. Shell startup health summary and quickstart remain the local runtime entrypoint"
echo "5. ThinUI C64 first-run panel can render as the local setup surface"
echo ""
echo "[uDOS-ubuntu] Browser workstation scaffold"
cat "$REPO_ROOT/examples/browser-workstation-scaffold.json"
echo ""
echo "[uDOS-ubuntu] ThinUI payload"
cat "$REPO_ROOT/examples/thinui-c64-launch.json"
echo ""

if command -v node >/dev/null 2>&1 && [ -f "$THINUI_DEMO" ]; then
  echo "[uDOS-ubuntu] Launching ThinUI C64 first-run demo"
  node "$THINUI_DEMO" --theme thinui-c64 --view boot-loader --title "uDOS Ubuntu Desktop" --subtitle "First-run setup handoff"
else
  echo "[uDOS-ubuntu] ThinUI sibling demo not available; setup story emitted only."
fi
