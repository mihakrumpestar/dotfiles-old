#!/bin/bash

echo -e "\n\e[1m Install system packages \e[0m\n"

PACKAGES=(
  # General configuration
  pciutils         # Computer utility info
  usbutils         # USB utility info
  udisks2          # AUR, command is udisksctl
  udiskie          # AUR, a user-level daemon for auto-mounting

  # System
  nano
  curl
  wget
  btop  # Better htop
  ntp   # time
  ufw   # firewall
  arcolinux-bootloader-systemd-boot-git # Hooks for arcolinux-system-config-git

  # Printer and scanner
  cups
  hplip
  sane
  sane-airscan
  avahi         # Network scanning (printer and scanner)
)

# the quotes are needed to preserve params with spaces
yay -S --noconfirm --needed --quiet "${PACKAGES[@]}"

sudo systemctl enable --now cups
sudo systemctl enable --now bluetooth
sudo systemctl enable --now avahi-daemon
sudo systemctl enable --now ntpd # time sync
sudo systemctl enable --now sshd
sudo timedatectl set-ntp on
# timedatectl
