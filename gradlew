#!/usr/bin/env sh
set -eu

GRADLE_VERSION="9.8.2"
DIST_DIR="${TMPDIR:-/tmp}/spear-dash-gradle-${GRADLE_VERSION}"
GRADLE_HOME="${DIST_DIR}/gradle-${GRADLE_VERSION}"
GRADLE_BIN="${GRADLE_HOME}/bin/gradle"
DIST_ZIP="gradle-${GRADLE_VERSION}-bin.zip"

if [ ! -x "${GRADLE_BIN}" ]; then
    mkdir -p "${DIST_DIR}"
    curl -fsSL "https://services.gradle.org/distributions/${DIST_ZIP}" -o "${DIST_DIR}/${DIST_ZIP}"
    unzip -q -o "${DIST_DIR}/${DIST_ZIP}" -d "${DIST_DIR}"
fi

exec "${GRADLE_BIN}" "$@"
