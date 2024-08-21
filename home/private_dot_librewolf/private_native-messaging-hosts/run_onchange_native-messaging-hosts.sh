#!/bin/bash

# Enable safe execution flags
set -euo pipefail

# native-messaging-hosts: {{ include "org.keepassxc.keepassxc_browser.json" | sha256sum }}

echo "Regenerating native-messaging-hosts..."

# Betterbird KeepassXC extension, docs: https://github.com/kkapsner/keepassxc-mail
mkdir -p ~/.mozilla/native-messaging-hosts
cat ~/.librewolf/native-messaging-hosts/org.keepassxc.keepassxc_browser.json \
 | sed s/keepassxc-browser@keepassxc.org/keepassxc-mail@kkapsner.de/ \
 | sed s/org.keepassxc.keepassxc_browser/de.kkapsner.keepassxc_mail/ \
 > ~/.mozilla/native-messaging-hosts/de.kkapsner.keepassxc_mail.json
