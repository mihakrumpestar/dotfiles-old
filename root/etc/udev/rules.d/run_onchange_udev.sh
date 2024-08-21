#!/bin/bash

# Enable safe execution flags
set -euo pipefail

# 49-onlykey.rules hash: {{ include "49-onlykey.rules" | sha256sum }}

echo "Updating Udev rules..."
sudo udevadm control --reload-rules
sudo udevadm trigger
