#!/bin/bash

# Hyprland
CONFIG_DIR="$HOME/.config/hypr"
UWSM_DIR="$HOME/.config/uwsm"
mkdir -p "$CONFIG_DIR"
mkdir -p "$UWSM_DIR"

# Clone the starter configuration
if [ ! -f "$CONFIG_DIR/.initialized" ]; then
  cp -rf /etc/xdg/hypr/hyprland.conf "$CONFIG_DIR/hyprland.conf"
  cp -rf /etc/xdg/hypr/hypridle.conf "$CONFIG_DIR/hypridle.conf"
  cp -rf /etc/zshrc "$HOME/.zshrc"
  touch "$CONFIG_DIR/.initialized"
fi

if [ ! -f "$UWSM_DIR/.initialized" ]; then
  cp -rf /etc/xdg/uwsm/env "$UWSM_DIR/env"
  cp -rf /etc/xdg/uwsm/env-hyprland "$UWSM_DIR/env-hyprland"
  touch "$UWSM_DIR/.initialized"
fi
