#!/bin/bash

# Enable safe execution flags
set -euo pipefail

applications_dir=$HOME/Applications

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

cp .config/autostart/onlykey-app.desktop .local/share/applications

app_name=ActivityWatch
repo_url="https://github.com/ActivityWatch/activitywatch/releases"

if [ ! -d "$applications_dir/$app_name" ]; then
    echo -e "\nInstalling $app_name..."
    
    # Create a temporary directory
    temp_dir=$(mktemp -d)
    
    # Download the latest release ZIP file
    latest_release_url=$(curl -s "$repo_url/latest" | grep -o 'https://github.com/ActivityWatch/activitywatch/releases/download/[^"]*linux-x86_64.zip' | head -n 1)
    wget -O "$temp_dir/$app_name.zip" "$latest_release_url"
    
    # Extract the ZIP file
    unzip "$temp_dir/$app_name.zip" -d "$temp_dir"
    
    # Move the extracted directory to the applications directory
    mv "$temp_dir/activitywatch" "$applications_dir/$app_name"
    
    # Clean up the temporary directory
    rm -rf "$temp_dir"
    
    echo "Installed $app_name"
else
    echo "$app_name is already installed."
fi