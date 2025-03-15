#!/usr/bin/env bash

set -oue pipefail

brew install neovim
distrobox-export --bin /home/linuxbrew/.linuxbrew/bin/nvim --export-path /usr/bin

git clone https://github.com/sonroyaalmerol/nvchad-personal-config /etc/xdg/nvim