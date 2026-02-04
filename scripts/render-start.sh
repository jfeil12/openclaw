#!/usr/bin/env bash
set -euo pipefail

# Render sets PORT for the container. Use it for the gateway.
if [[ -z "${PORT:-}" ]]; then
  echo "PORT is not set; defaulting to 8080"
  export PORT=8080
fi

# Default to LAN bind so Render can reach the gateway/control UI.
export OPENCLAW_GATEWAY_BIND="${OPENCLAW_GATEWAY_BIND:-lan}"

# Prefer PORT env for gateway port (Render convention).
export OPENCLAW_GATEWAY_PORT="${OPENCLAW_GATEWAY_PORT:-${PORT}}"

# Start gateway (allow unconfigured so setup can run on first boot).
exec node dist/index.js gateway --allow-unconfigured
