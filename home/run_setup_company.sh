#!/bin/bash

# Enable safe execution flags
set -euo pipefail

if [[ "$HOSTNAME" == *"company"* ]]; then

  echo -e "\n\e[1m Company config \e[0m\n"

  yay -S --noconfirm --needed extra/clamav extra/clamtk
  sudo touch /var/log/clamav/freshclam.log
  sudo chmod 600 /var/log/clamav/freshclam.log
  sudo chown clamav /var/log/clamav/freshclam.log

  # sudo chown -R clamav:clamav /var/lib/clamav # not sure if it was initialy correct
  sudo systemctl enable --now clamav-freshclam.service
  # sudo systemctl status clamav-freshclam.service

  sudo systemctl enable --now clamav-daemon.service
  # sudo systemctl status clamav-daemon.service

  go env -w GOPRIVATE=github.com/[company]

  yay -S --noconfirm --needed qemu-full libvirt
  # Test: virt-host-validate
  sudo usermod -a -G libvirt $USER
  sudo systemctl enable --now libvirtd
  minikube config set driver kvm2

fi
