#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-syncd"
SERVICE_PORT="${UDOS_SYNCD_PORT:-7103}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
