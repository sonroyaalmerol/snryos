#!/usr/bin/env bash

set -oue pipefail

git clone https://github.com/ghostty-org/ghostty

cd ghostty
git checkout v1.1.2

zig build -p /usr -Doptimize=ReleaseFast

cd ..
rm -rf ghostty