#!/usr/bin/env bash
# ── Gauge Runner ────────────────────────────────────────────────────
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

JAR=$(ls target/gauge-*-runner.jar 2>/dev/null | head -1)

if [ -z "$JAR" ]; then
    echo "No runner jar found in target/. Build with: mvn clean package"
    exit 1
fi

echo "Starting: $JAR"
QUARKUS_CONFIG_LOCATIONS=application.properties java -jar "$JAR"
