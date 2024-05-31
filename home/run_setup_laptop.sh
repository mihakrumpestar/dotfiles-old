#!/bin/bash

# Enable safe execution flags
set -euo pipefail

if [[ "$HOSTNAME" == *"laptop"* ]]; then

  echo -e "\n\e[1m Laptop config \e[0m\n"

  PACKAGES=(
    auto-cpufreq
    onboard
    xf86-input-wacom
    wacom-settings-git
    kded-rotation-git
  )

  yay -S --noconfirm --needed --noprogressbar --quiet "${PACKAGES[@]}" 2>&1 | awk '!/Sync Dependency/ && !/Sync Explicit/ && !/-- skipping/'

  sudo systemctl enable --now auto-cpufreq
  #auto-cpufreq --stats
  # Or in GUI app
fi
