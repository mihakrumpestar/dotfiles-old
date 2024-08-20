#!/bin/bash

# Enable safe execution flags
set -euo pipefail

applications_dir="$HOME/Applications"
mkdir -p "$applications_dir"

app_name=OnlyKey-App
repo_url="https://github.com/trustcrypto/OnlyKey-App.git"

if [ ! -d "$applications_dir/$app_name" ]; then
    echo -e "\nInstalling $app_name..."
    
    # Clone only the latest commit of the default branch, without history
    git clone --depth 1 --single-branch "$repo_url" "$applications_dir/$app_name"
    
    # Change to the application directory
    cd "$applications_dir/$app_name" || exit
    
    npm install
    
    echo "Installed $app_name"
else
    echo "$app_name is already installed."
fi

cp ~/.config/autostart/onlykey-app.desktop ~/.local/share/applications
