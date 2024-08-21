#!/bin/bash

# Enable safe execution flags
set -euo pipefail

# This comment ensures the script runs hourly:
# {{ now.Format "2006-01-02 15" }}

sudo pacman -Syu
