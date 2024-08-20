#!/bin/bash

# Enable safe execution flags
set -euo pipefail

BANNER='echo -e \n\e[1m Code editor extensions config \e[0m\n'

# Aliases don't work here so we have to issue commend "codium" instead of "code"

# Path to the extensions file
extensions_file="$REPO_DIR/home/dot_config/private_VSCodium/User/extensions"

# Get the list of installed extensions
installed_extensions=$(codium --list-extensions)

if [ -z "$installed_extensions" ]; then
  # If there are no installed extensions, install them from the extensions file

  if [ -f "$extensions_file" ]; then
    
    $BANNER
    echo "Installing extensions from $extensions_file..."
    
    while read -r extension; do
      codium --install-extension "$extension"
    done < "$extensions_file"
    
    echo "Extensions installed."
  
  else

    $BANNER
    echo "No extensions found in $extensions_file."

  fi
else
  # Check if there's a change in the installed extensions
  if ! diff -q <(echo "$installed_extensions") "$extensions_file" > /dev/null; then

    $BANNER
    echo "Extensions have changed. Updating $extensions_file..."
    echo "$installed_extensions" > "$extensions_file"
    echo "Extensions updated."
    
  fi
fi
