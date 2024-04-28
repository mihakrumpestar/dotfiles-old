#!/bin/bash

if [[ "$HOSTNAME" == *"laptop"* ]]; then

  echo -e "\n\e[1m Laptop config \e[0m\n"

  PACKAGES=(
    auto-cpufreq
    onboard
    kcm-wacomtablet
    xf86-input-wacom
    wacom-settings-git
    kded-rotation-git
  )

  yay -S --noconfirm --needed "${PACKAGES[@]}"

  sudo systemctl enable --now auto-cpufreq

fi
