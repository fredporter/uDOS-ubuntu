#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-web"
SERVICE_PORT="${UDOS_WEB_PORT:-7107}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
