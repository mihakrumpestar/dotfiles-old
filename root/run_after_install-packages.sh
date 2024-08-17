#!/bin/bash

# Enable safe execution flags
set -euo pipefail

echo -e "\n\e[1m Install system packages \e[0m\n"

PACKAGES=(
   # Package manager
)

# the quotes are needed to preserve params with spaces
yay -S --noconfirm --needed --noprogressbar --quiet "${PACKAGES[@]}" 2>&1 | awk '!/Sync Dependency/ && !/Sync Explicit/ && !/-- skipping/'

required=$(sed -n '/#/d; /UTF-8/s/\.UTF-8.*//p' /etc/locale.gen)
current=$(locale -a | sed 's/\.utf8//')
missing=$(comm -23 <(echo "$required" | sort) <(echo "$current" | sort))

if [ -n "$missing" ]; then
    echo "Regenerating locales..."
    sudo locale-gen
else
    echo "All required locales are already generated."
fi

# TODO: automate udev rules
sudo udevadm control --reload-rules && sudo udevadm trigger
