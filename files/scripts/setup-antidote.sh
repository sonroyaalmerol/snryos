#!/usr/bin/env bash

set -oue pipefail

chsh -s $(which zsh)

# Install Antidote using git
echo "Installing Antidote plugin manager..."
git clone --depth=1 https://github.com/mattmc3/antidote.git /usr/share/antidote
