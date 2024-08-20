#!/bin/bash

# Enable safe execution flags
set -euo pipefail

# Ignore SIGPIPE
trap '' PIPE

BANNER='echo -e \n\e[1m Code editor extensions config \e[0m\n'

# Path to the extensions file in the home directory
extensions_file="$HOME/.config/VSCodium/User/extensions"

# Function to safely get installed extensions
get_installed_extensions() {
    codium --list-extensions 2>/dev/null || echo ""
}

# Function to install an extension if it's not already installed
install_extension() {
    local extension="$1"
    if ! echo "$installed_extensions" | grep -q "^$extension$"; then
        echo "Installing extension: $extension"
        codium --install-extension "$extension" || echo "Failed to install $extension"
    fi
}

$BANNER
echo "Checking extensions..."

# Get the list of installed extensions
installed_extensions=$(get_installed_extensions)

if [ -f "$extensions_file" ]; then
    # Quick check for changes
    if diff -q <(echo "$installed_extensions" | sort) <(grep -v '^#' "$extensions_file" | sed '/^$/d' | sort) > /dev/null; then
        echo "No changes detected."
        exit 0
    fi

    echo "Changes detected. Syncing extensions with $extensions_file..."

    # Create a temporary file to store the updated extensions list
    temp_file=$(mktemp)

    # Process the extensions file
    while IFS= read -r extension || [[ -n "$extension" ]]; do
        # Trim whitespace
        extension=$(echo "$extension" | xargs)
        
        # Skip empty lines and comments
        if [[ -z "$extension" || "$extension" == \#* ]]; then
            echo "$extension" >> "$temp_file"
            continue
        fi

        # Install the extension if it's not already installed
        install_extension "$extension"
        echo "$extension" >> "$temp_file"
    done < "$extensions_file"

    # Add newly installed extensions to the file
    while IFS= read -r installed_extension; do
        if ! grep -q "^$installed_extension$" "$temp_file"; then
            echo "Adding newly installed extension to file: $installed_extension"
            echo "$installed_extension" >> "$temp_file"
        fi
    done <<< "$installed_extensions"

    # Replace the original file with the updated one
    mv "$temp_file" "$extensions_file"

    echo "Extensions synced successfully."
else
    echo "Extensions file not found: $extensions_file"
    echo "Creating file with currently installed extensions."
    echo "$installed_extensions" > "$extensions_file"
    
    # If no extensions are installed, inform the user
    if [ -z "$installed_extensions" ]; then
        echo "No extensions are currently installed."
    fi
fi
