#!/usr/bin/env bash
set -eu
SERVICE_ID="udos-wizard-adapter"
SERVICE_PORT="${UDOS_WIZARD_ADAPTER_PORT:-7108}"
exec "$(cd "$(dirname "$0")" && pwd)/lib/service-stub.sh"
