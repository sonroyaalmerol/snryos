#!/usr/bin/env bash

set -oue pipefail

# Define the path to the repo file
REPO_FILE="/etc/yum.repos.d/fedora-updates.repo"

# Check if the file exists
if [[ ! -f "$REPO_FILE" ]]; then
  echo "Error: $REPO_FILE does not exist."
  exit 1
fi

# Check if the [updates] section already contains the exclude line
if grep -q "^\[updates\]" "$REPO_FILE" && grep -A 10 "^\[updates\]" "$REPO_FILE" | grep -q "exclude=kernel\*"; then
  echo "The exclude=kernel* line is already present in the [updates] section."
  exit 0
fi

# Add the exclude=kernel* line to the [updates] section
sed -i '/^\[updates\]/,/^\[/{/^\[updates\]/!{/^\[/!{ $aexclude=kernel* }}}' "$REPO_FILE"

# Verify the change
if grep -q "^\[updates\]" "$REPO_FILE" && grep -A 10 "^\[updates\]" "$REPO_FILE" | grep -q "exclude=kernel\*"; then
  echo "Successfully added exclude=kernel* to the [updates] section."
else
  echo "Failed to add exclude=kernel* to the [updates] section."
  exit 1
fi
