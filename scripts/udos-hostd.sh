#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-hostd"
SERVICE_PORT="${UDOS_HOSTD_PORT:-7100}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
