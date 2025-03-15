#!/usr/bin/env bash

set -oue pipefail

# Define the Nerd Fonts GitHub repository
nerd_fonts_repo="https://github.com/ryanoasis/nerd-fonts.git"

# Define the source directory for Nerd Fonts
nerdfonts_root_dir="$(pwd)/nerd-fonts/patched-fonts"

# Define the target directory for system-wide installation
sys_font_dir="/usr/local/share/fonts/NerdFonts"

# Clone the Nerd Fonts repository if it doesn't already exist
if [ ! -d "nerd-fonts" ]; then
  echo "Cloning Nerd Fonts repository..."
  git clone --depth=1 "$nerd_fonts_repo"
else
  echo "Nerd Fonts repository already exists. Pulling latest changes..."
  git -C nerd-fonts pull
fi

# Ensure the patched-fonts directory exists
if [ ! -d "$nerdfonts_root_dir" ]; then
  echo "Error: Patched fonts directory not found in the repository."
  exit 1
fi

# Create the target directory if it doesn't exist
echo "Creating system-wide font directory at $sys_font_dir..."
mkdir -p "$sys_font_dir"

# Find all font files (both .otf and .ttf) in the source directory
echo "Copying fonts to $sys_font_dir..."
find "$nerdfonts_root_dir" -iname '*.[ot]tf' -type f -print0 | while IFS= read -r -d $'\0' file; do
  cp -f "$file" "$sys_font_dir"
done

# Set proper permissions for the system-wide font directory
echo "Setting permissions for $sys_font_dir..."
chmod -R 755 "$sys_font_dir"
chown -R root:root "$sys_font_dir"

# Refresh the font cache
echo "Refreshing font cache..."
fc-cache -vf "$sys_font_dir"

echo "All Nerd Fonts have been installed system-wide to $sys_font_dir."