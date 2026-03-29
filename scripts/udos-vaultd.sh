#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-vaultd"
SERVICE_PORT="${UDOS_VAULTD_PORT:-7102}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
