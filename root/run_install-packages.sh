#!/bin/bash

# Enable safe execution flags
set -euo pipefail

echo -e "\n\e[1m Install system packages \e[0m\n"

PACKAGES=(
  nix # Package manager
)

# the quotes are needed to preserve params with spaces
yay -S --noconfirm --needed --noprogressbar --quiet "${PACKAGES[@]}" 2>&1 | awk '!/Sync Dependency/ && !/Sync Explicit/ && !/-- skipping/'

# Nix package manager
sudo systemctl enable --now nix-daemon.service

sudo groupadd -f nix-users
sudo usermod -aG nix-users $USER

# nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
# nix-channel --update
# nix-channel --list
