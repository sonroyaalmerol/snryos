#!/bin/bash

# Hyprland
CONFIG_DIR="$HOME/.config/hypr"
mkdir -p "$CONFIG_DIR"

# Clone the starter configuration
if [ ! -f "$CONFIG_DIR/.initialized" ]; then
  cp -rf /etc/xdg/hypr/hyprland.conf "$CONFIG_DIR/hyprland.conf"
  cp -rf /etc/xdg/hypr/hypridle.conf "$CONFIG_DIR/hypridle.conf"
  touch "$CONFIG_DIR/.initialized"
fi
