#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-commandd"
SERVICE_PORT="${UDOS_COMMANDD_PORT:-7101}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
