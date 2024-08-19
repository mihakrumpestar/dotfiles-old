#!/bin/bash

# Enable safe execution flags
set -euo pipefail

echo -e "\n\e[1m Install user packages \e[0m\n"

devbox global install

# glxinfo -B | grep "OpenGL version"

# Aplications
mkdir -p ~/.local/share/applications
ln -sf $DEVBOX_PACKAGES_DIR/share/applications/* ~/.local/share/applications/
sudo ln -sf $DEVBOX_PACKAGES_DIR/bin/* /usr/local/bin/

# Fonts
mkdir -p ~/.local/share/fonts
sudo ln -sf $DEVBOX_PACKAGES_DIR/share/fonts/* ~/.local/share/fonts
# fc-cache -fv

# Icons
mkdir -p ~/.local/share/icons
ln -sf $DEVBOX_PACKAGES_DIR/share/icons/* ~/.local/share/icons

# SystemD
#sudo ln -sf $DEVBOX_PACKAGES_DIR/etc/systemd/system/docker.* /etc/systemd/system # Each of required ones, we don't want to override system ones (like dbus)
#sudo systemctl daemon-reload

# D-Bus
mkdir -p ~/.local/share/dbus-1
sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/* ~/.local/share/dbus-1
#sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/system.d/org.corectrl.* /usr/share/dbus-1/system.d
#sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/system-services/org.corectrl.* /usr/share/dbus-1/system-services
#sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/services/* /usr/share/dbus-1/services
#sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/service/* /usr/share/dbus-1/service
#sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/interfaces/org.flameshot.* /usr/share/dbus-1/interfaces

# VSCodium extensions
sudo ln -sf $DEVBOX_PACKAGES_DIR/share/vscode/extensions/* ~/.vscode-oss/extensions

# usr lib/libexec
sudo ln -sf $DEVBOX_PACKAGES_DIR/libexec/kdeconnectd /usr/lib

# sudo npm i -g prettier-plugin-sh prettier-plugin-toml prettier-plugin-go-template

# Docker
sudo groupadd -f docker
sudo usermod -aG docker $USER
#sudo systemctl enable --now docker # TODO: not working

## User
systemctl --user enable --now ssh-agent # SSH agent

# Make sure user services are started on boot
loginctl enable-linger $USER

# Mount remote storage
systemctl --user enable --now rclone@nextcloud-personal || echo "Rclone failed"
# rclone listremotes

# Dead mens switch
systemctl --user enable --now dead-mens-switch.timer
# systemctl --user list-timers --all

# Function to clone a repo, initialize it, and create a desktop entry
setup_app() {
    local repo_url="$1"
    local app_name="$2"
    local init_command="$3"
    local entry_command="$4"
    local icon_name="$5"

    # Define directories
    local base_dir="\$HOME/Applications"
    local repo_dir="$base_dir/$app_name"
    local desktop_entry="\$HOME/.local/share/applications/$app_name.desktop"
    local icon_path="$repo_dir/$icon_name"

    # Replace actual $HOME with $HOME variable in entry_command
    local full_entry_command=$(echo "$entry_command" | sed "s|$HOME|\$HOME|g")
    # Replace $repo_dir placeholder with actual $repo_dir in entry_command
    full_entry_command=$(echo "$full_entry_command" | sed "s|\$repo_dir|$repo_dir|g")

    # Create base directory if it doesn't exist
    mkdir -p "$HOME/Applications"

    # Clone the repository if it doesn't exist
    if [ ! -d "$HOME/Applications/$app_name" ]; then
        echo "Cloning $app_name repository..."
        git clone "$repo_url" "$HOME/Applications/$app_name"
        
        # Run the initialization command if provided
        if [ -n "$init_command" ]; then
            echo "Running initialization command for $app_name..."
            (cd "$HOME/Applications/$app_name" && eval "$init_command")
        fi
    
        # Create a desktop entry
        echo "Creating desktop entry for $app_name..."
        cat > "$HOME/.local/share/applications/$app_name.desktop" <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=$app_name
Exec=$full_entry_command
Icon=$icon_path
Terminal=false
Categories=Utility;
EOL

# Add executable (bash script) to /users/local/bin

        echo "Desktop entry created at $HOME/.local/share/applications/$app_name.desktop"
    
    else
        echo "$app_name repository already exists."
    fi
}

setup_app "https://github.com/trustcrypto/OnlyKey-App.git" "OnlyKey" "npm install" "npm run --prefix \"\$repo_dir\" start" "resources/onlykey_logo_128.png"
