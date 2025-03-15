#!/bin/bash

# Ensure the Flatpak app's configuration directory exists
CONFIG_DIR="$HOME/.var/app/io.neovim.nvim/config/nvim"
mkdir -p "$CONFIG_DIR"

# Clone the starter configuration
if [ ! -d "$CONFIG_DIR/.git" ]; then
  git clone https://github.com/sonroyaalmerol/nvchad-personal-config "$CONFIG_DIR"
else
  echo "Configuration already exists. Skipping clone."
fi

alias nvim="flatpak run io.neovim.nvim"