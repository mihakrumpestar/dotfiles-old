#!/bin/bash

# Enable safe execution flags
set -euo pipefail

echo -e "\n\e[1m Install user packages \e[0m\n"

devbox global install

sudo systemctl enable --now gpu-driver-setup.service

# glxinfo -B | grep "OpenGL version"

# Aplications
ln -sf $DEVBOX_PACKAGES_DIR/share/applications/* /home/$USER/.local/share/applications/
sudo ln -sf $DEVBOX_PACKAGES_DIR/bin/* /usr/local/bin/

# Fonts
mkdir -p ~/.local/share/fonts
sudo ln -sf $DEVBOX_PACKAGES_DIR/share/fonts/* ~/.local/share/fonts
# fc-cache -fv

# Icons
mkdir -p ~/.local/share/icons
ln -sf $DEVBOX_PACKAGES_DIR/share/icons/* /home/$USER/.local/share/icons

# SystemD
sudo ln -sf $DEVBOX_PACKAGES_DIR/etc/systemd/system/docker.* /etc/systemd/system # Each of required ones, we don't want to override system ones (like dbus)
sudo systemctl daemon-reload

# D-Bus
sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/system.d/org.corectrl.* /usr/share/dbus-1/system.d
sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/system-services/org.corectrl.* /usr/share/dbus-1/system-services
sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/services/* /usr/share/dbus-1/services
sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/service/* /usr/share/dbus-1/service
sudo ln -sf $DEVBOX_PACKAGES_DIR/share/dbus-1/interfaces/org.flameshot.* /usr/share/dbus-1/interfaces

# sudo npm i -g prettier-plugin-sh prettier-plugin-toml prettier-plugin-go-template

## System
#sudo systemctl enable --now cups
sudo systemctl enable --now bluetooth
sudo systemctl enable --now avahi-daemon
#sudo systemctl enable --now ntpd # time sync
sudo systemctl enable --now sshd
#sudo systemctl enable --now libvirtd # QEMU
#sudo systemctl enable --now nftables
# sudo nft list tables
# sudo nft list ruleset

sudo timedatectl set-ntp on
# timedatectl

# Docker
sudo groupadd -f docker
sudo usermod -aG docker $USER
#sudo systemctl enable --now docker # TODO: not working

## User
systemctl --user enable --now ssh-agent # SSH agent

# Make sure user services are started on boot
loginctl enable-linger $USER

# Mount remote storage
systemctl --user enable --now rclone@nextcloud-personal
# rclone listremotes

# Symbolic links
#sudo ln -sf /usr/lib/ssh/gnome-ssh-askpass4 /usr/lib/ssh/x11-ssh-askpass

# Dead mens switch
#systemctl --user enable --now dead-mens-switch.timer
# systemctl --user list-timers --all
