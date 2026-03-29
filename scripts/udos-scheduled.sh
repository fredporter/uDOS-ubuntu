#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-scheduled"
SERVICE_PORT="${UDOS_SCHEDULED_PORT:-7104}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
