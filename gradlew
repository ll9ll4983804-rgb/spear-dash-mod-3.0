#!/usr/bin/env sh
set -e

GRADLE_VERSION="9.3.1"
DIST_DIR="$HOME/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}-bin"
ZIP_FILE="/tmp/gradle-${GRADLE_VERSION}-bin.zip"
URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"

GRADLE_BIN=$(find "$DIST_DIR" -type f -name "gradle" 2>/dev/null | head -n 1)

if [ -z "$GRADLE_BIN" ]; then
  mkdir -p "$DIST_DIR" /tmp
  curl -fsSL "$URL" -o "$ZIP_FILE"
  unzip -q "$ZIP_FILE" -d "$DIST_DIR"
  GRADLE_BIN=$(find "$DIST_DIR" -type f -name "gradle" | head -n 1)
  chmod +x "$GRADLE_BIN"
fi

exec "$GRADLE_BIN" "$@"
