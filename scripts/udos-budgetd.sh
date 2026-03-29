#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-budgetd"
SERVICE_PORT="${UDOS_BUDGETD_PORT:-7106}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
