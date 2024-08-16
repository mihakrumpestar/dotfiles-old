#!/bin/bash

# Enable safe execution flags
set -euo pipefail

echo -e "\n\e[1m Install user packages \e[0m\n"

nix-env -if ./packages.nix --quiet
# nix-env -q
# nix-env --list-generations
# nix-collect-garbage

# sudo npm i -g prettier-plugin-sh prettier-plugin-toml prettier-plugin-go-template

## System
sudo systemctl enable --now cups
sudo systemctl enable --now bluetooth
sudo systemctl enable --now avahi-daemon
sudo systemctl enable --now ntpd # time sync
sudo systemctl enable --now sshd
sudo systemctl enable --now libvirtd # QEMU
sudo systemctl enable --now nftables
# sudo nft list tables
# sudo nft list ruleset

sudo timedatectl set-ntp on
# timedatectl

# Docker
sudo groupadd -f docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker

## User
systemctl --user enable --now ssh-agent # SSH agent

# Make sure user services are started on boot
loginctl enable-linger $USER

# Mount remote storage
systemctl --user enable --now rclone@nextcloud-personal
# rclone listremotes

# Symbolic links
sudo ln -sf /usr/lib/ssh/gnome-ssh-askpass4 /usr/lib/ssh/x11-ssh-askpass

# Dead mens switch
systemctl --user enable --now dead-mens-switch.timer
# systemctl --user list-timers --all
