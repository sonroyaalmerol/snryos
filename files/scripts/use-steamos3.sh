#!/usr/bin/env bash

set -e

DESKTOP_FILE="/usr/share/applications/steam.desktop"

if [ ! -f "${DESKTOP_FILE}" ]; then
  echo "Error: File not found: ${DESKTOP_FILE}" >&2
  exit 1
fi

sed -i \
    -e 's#^Exec=/usr/bin/steam %U$#Exec=/usr/bin/steam -steamos3 %U#' \
    -e 's#^Exec=steam steam://#Exec=steam -steamos3 steam://#' \
    "${DESKTOP_FILE}"

exit 0
