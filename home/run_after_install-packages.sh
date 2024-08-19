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

# usr lib/libexec
sudo ln -sf $DEVBOX_PACKAGES_DIR/libexec/kdeconnectd /usr/lib
sudo ln -sf /usr/local/bin/ksshaskpass /usr/lib/ssh/ssh-askpass

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
