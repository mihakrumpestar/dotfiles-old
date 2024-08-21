#!/bin/bash

# Enable safe execution flags
set -euo pipefail

# locale.gen: {{ include "locale.gen" | sha256sum }}

echo "Regenerating locales..."
sudo locale-gen
