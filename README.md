# Arch dotfiles

Shortcuts:

```text
# # Starting and Stopping Applications
Meta                # Open the Application Launcher
Alt+Space / Alt+F2  # Run Command Interface
Ctrl+Esc            # System Activity
Alt+F4              # Close
Ctrl+Q              # Quit
Ctrl+Alt+Esc        # Force Quit

# # Moving Around
Ctrl+F10        # Present Windows
Ctrl+F9         # Present Windows on current desktop
Ctrl+F7         # Present Windows of current application only
Ctrl+F12        # Show Desktop
Ctrl+Alt+A      # Activate Window Demanding Attention
Alt+Tab         # Walk through windows
Alt+Shift+Tab   # Walk through windows (Reverse)
Alt+F3          # Open the Window Operations menu
Meta+Alt+Up     # Switch to Window Above
Meta+Alt+Down   # Switch to Window Below
Meta+Alt+Left   # Switch to Window to the Left
Meta+Alt+Right  # Switch to Window to the Right

# # Panning
Meta+Up     # Pan Up
Meta+Down   # Pan Down
Meta+Left   # Pan left, move window to monitor to the left[a]
Meta+Right  # Pan right, move window to monitor to the right[a]
Meta+PgUp   # Maximize/Restore window
Meta+PgDn   # Minimize window

# # Working Virtual Desktops
Ctrl+F1     # Switch to Desktop 1
Ctrl+F[x]   # Switch to Desktop x

# # Leaving Your Computer
Ctrl+Alt+L      # Lock Screen
Ctrl+Alt+Del    # Leave

# # Terminal
Ctrl+W # Delete a word backward
Ctrl+U # K ills the whole line

# # #
# # # Extra
# # #

# # Clipboard manager
Ctrl+Shift+X    # Open copy history under cursor

```

Packages:

- https://search.nixos.org/packages
- https://www.nixhub.io/

TODO:

```sh
https://0pointer.net/blog/unlocking-luks2-volumes-with-tpm2-fido2-pkcs11-security-hardware-on-systemd-248.html
https://wiki.mozilla.org/Security/Sandbox/SELinux
https://github.com/linrunner/TLP
https://github.com/probonopd/go-appimage
```

On new system:

```bash
# Reboot

# Install deps
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin

curl -fsSL https://get.jetify.com/devbox | bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Nix package manager
sudo systemctl enable --now nix-daemon.service

sudo groupadd -f nix-users
sudo usermod -aG nix-users $USER

sudo GOBIN=/usr/local/bin/ go install github.com/Ibotta/sopstool@latest

cp home/dot_local/share/devbox/global/default/devbox.json ~/.local/share/devbox/global/default/devbox.json
devbox global install

go-task apply-without-secrets

balooctl6 purge # Clean KDE file indexer

reboot # Kwallet will get disabled, so we can use KeepassXC as secret provider

task apply
```

DO NOT USE `chezmoi apply` directly!

Usage:

```sh
task apply
task merge
```

Cheat sheet:

```bash
chezmoi add -r --config chezmoi.toml

chezmoi add --source ./home [target_file]
chezmoi add --source ./root  --destination / [target_file]
chezmoi add --template --source ./home [target_file]
chezmoi add --template --source ./root --destination / [target_file]

chezmoi target-path --source ./home [target_file]

sopstool add [source_file]
```

[Other dotfile managers](https://dotfiles.github.io/utilities/):

- [dotbot](https://github.com/anishathalye/dotbot)
- [yadm](https://github.com/TheLocehiliosan/yadm)
