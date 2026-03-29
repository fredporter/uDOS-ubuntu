#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-thinui"
SERVICE_PORT="${UDOS_THINUI_PORT:-0}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
