# Arch dotfiles

Alternatives:

- [BlendOS](https://blendos.co/): immutable, atomic and declarative Arch Linux system, with all mayor package managers and Android
- [VanillaOS](https://vanillaos.org/): immutable distro with support for all existing package managers from all distributions

TODO:

```sh
https://0pointer.net/blog/unlocking-luks2-volumes-with-tpm2-fido2-pkcs11-security-hardware-on-systemd-248.html
https://wiki.mozilla.org/Security/Sandbox/SELinux
https://github.com/linrunner/TLP
https://github.com/probonopd/go-appimage
```

On new system:

```bash
# Disable KWallet (KDE settings)
# Reboot

# Install deps
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin
yay -Sy --noconfirm --needed onlykey keepassxc vscodium-bin chezmoi sops go
env GOBIN=/bin sudo go install github.com/go-task/task/v3/cmd/task@latest github.com/Ibotta/sopstool@latest

read -p "Input Github PAT token (and make sure KeepassXC secret-service works) > " -r && git clone https://${REPLY}@github.com/mihakrumpestar/dotfiles.git
cd dotfiles
cat home/dot_config/chezmoi/chezmoi.yaml > ~/.config/chezmoi/chezmoi.yaml
task apply
git remote set-url origin git@github.com:mihakrumpestar/dotfiles.git
```

DO NOT USE `chezmoi apply` directly, since it will just copy folders to home dir.

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
