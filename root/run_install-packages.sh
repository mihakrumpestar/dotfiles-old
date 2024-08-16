#!/bin/bash

# Enable safe execution flags
set -euo pipefail

echo -e "\n\e[1m Install system packages \e[0m\n"

PACKAGES=(
   # Package manager
)

# the quotes are needed to preserve params with spaces
yay -S --noconfirm --needed --noprogressbar --quiet "${PACKAGES[@]}" 2>&1 | awk '!/Sync Dependency/ && !/Sync Explicit/ && !/-- skipping/'
