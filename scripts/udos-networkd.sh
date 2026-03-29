#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-networkd"
SERVICE_PORT="${UDOS_NETWORKD_PORT:-7105}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
