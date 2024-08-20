#!/bin/bash

# Enable safe execution flags
set -euo pipefail

echo -e "\n\e[1m Udev rules changed \e[0m\n"

# 49-onlykey.rules hash: {{ include "/etc/udev/rules.d/49-onlykey.rules" | sha256sum }}

sudo udevadm control --reload-rules
sudo udevadm trigger
