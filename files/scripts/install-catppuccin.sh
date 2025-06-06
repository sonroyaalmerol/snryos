#!/usr/bin/env bash

set -oue pipefail

cd /tmp

git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git

cd Catppuccin-GTK-Theme/themes

./install.sh
