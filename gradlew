#!/usr/bin/env sh

GRADLE_VERSION="8.5"
DIST_ZIP="gradle-${GRADLE_VERSION}-bin.zip"
URL="https://services.gradle.org/distributions/${DIST_ZIP}"

GRADLE_BIN=$(find "$HOME/.gradle/wrapper/dists" -type f -name 'gradle' 2>/dev/null | head -n 1)

if [ -z "$GRADLE_BIN" ]; then
  set -e
  TMP_DIR=$(mktemp -d)
  curl -sSL "$URL" -o "$TMP_DIR/${DIST_ZIP}"
  unzip -q "$TMP_DIR/${DIST_ZIP}" -d "$TMP_DIR"
  GRADLE_BIN=$(find "$TMP_DIR" -type f -name 'gradle' | head -n 1)
  chmod +x "$GRADLE_BIN"
fi

exec "$GRADLE_BIN" "$@"
