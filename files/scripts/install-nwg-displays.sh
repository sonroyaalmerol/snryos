#!/usr/bin/env bash

set -oue pipefail

cd /tmp

git clone https://github.com/nwg-piotr/nwg-displays.git

cd nwg-displays

bash install.sh

