#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-tuid"
SERVICE_PORT="${UDOS_TUID_PORT:-0}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
