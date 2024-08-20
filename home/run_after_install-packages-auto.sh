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

sudo ln -sf /usr/local/bin/go-task /usr/local/bin/task
ln -sf $DEVBOX_PACKAGES_DIR/share/rofi ~/.local/share

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

## User
systemctl --user enable --now ssh-agent # SSH agent

# Make sure user services are started on boot
sudo loginctl enable-linger $USER
# loginctl list-users

# Mount remote storage
systemctl --user enable --now rclone@nextcloud-personal || echo "Rclone failed"
# rclone listremotes

# Dead mens switch
systemctl --user enable --now dead-mens-switch.timer
# systemctl --user list-timers --all

# ActivityWatch
systemctl --user enable --now activitywatch

# Betterbird KeepassXC extension, docs: https://github.com/kkapsner/keepassxc-mail
mkdir -p ~/.mozilla/native-messaging-hosts
cat ~/.librewolf/native-messaging-hosts/org.keepassxc.keepassxc_browser.json \
 | sed s/keepassxc-browser@keepassxc.org/keepassxc-mail@kkapsner.de/ \
 | sed s/org.keepassxc.keepassxc_browser/de.kkapsner.keepassxc_mail/ \
 > ~/.mozilla/native-messaging-hosts/de.kkapsner.keepassxc_mail.json
