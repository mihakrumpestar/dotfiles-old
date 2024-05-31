#!/bin/bash

# Enable safe execution flags
set -euo pipefail

# Check if "company" is not present in the hostname and "/usr/bin/vhuit64" does not exist
if [[ "$HOSTNAME" != *"company"* ]] && [ ! -f "/usr/bin/vhuit64" ]; then

    echo -e "\n\e[1m Virtualhere config \e[0m\n"

    wget https://www.virtualhere.com/sites/default/files/usbclient/vhuit64

    chmod +x vhuit64
    chmod 755 vhuit64
    sudo mv vhuit64 /usr/bin/vhuit64

fi
