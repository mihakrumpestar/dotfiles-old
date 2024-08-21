#!/bin/bash

# Enable safe execution flags
set -euo pipefail

echo -e "\n\e[1m Install system packages \e[0m\n"

PACKAGES=(
    cups
    system-config-printer
    hplip
    sane-airscan
    avahi    # Network scanning (printer and scanner)
    docker
    docker-compose
)

# the quotes are needed to preserve params with spaces
sudo pacman -S --noconfirm --needed --noprogressbar --quiet "${PACKAGES[@]}" 2>&1 | awk '!/Sync Dependency/ && !/Sync Explicit/ && !/-- skipping/'

# GPU drivers for devbox apps
sudo systemctl enable --now gpu-driver-setup.service

## System
sudo systemctl enable --now cups
sudo systemctl enable --now bluetooth
sudo systemctl enable --now avahi-daemon
#sudo systemctl enable --now ntpd # time sync
sudo systemctl enable --now sshd
#sudo systemctl enable --now libvirtd # QEMU
sudo systemctl enable --now nftables
# sudo nft list tables
# sudo nft list ruleset

sudo timedatectl set-ntp on
# timedatectl

# Docker
sudo groupadd -f docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker # nix-env version of Docker will never work on non-nixOS distros
