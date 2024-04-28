# Arch dotfiles

Alternatives:

- [BlendOS](https://blendos.co/): immutable, atomic and declarative Arch Linux system, with all mayor package managers and Android
- [VanillaOS](https://vanillaos.org/): immutable distro with support for all existing package managers from all distributions

TODO:

```sh
https://0pointer.net/blog/unlocking-luks2-volumes-with-tpm2-fido2-pkcs11-security-hardware-on-systemd-248.html
https://wiki.mozilla.org/Security/Sandbox/SELinux

https://github.com/linrunner/TLP
https://gitlab.com/leinardi/gwe

https://github.com/probonopd/go-appimage
https://github.com/shalva97/kde-configuration-files
```

On new system:

```bash
# Disable KWallet (KDE settings)
# Reboot

yay -Sy go-task-bin keepassxc onlykey vscodium-bin chezmoi

# Unlock keepassxc

mkdir -p repos/personal
vscodium repos/personal
# clone repo using VSCodium git@github.com:mihakrumpestar/dotfiles

cat home/dot_config/chezmoi/chezmoi.yaml > ~/.config/chezmoi/chezmoi.yaml
go-task apply
```

DO NOT USE `chezmoi apply` directly, since it will just copy folders to home dir.

Cheat sheet:

```bash
chezmoi init
chezmoi add -r --config chezmoi.toml

chezmoi add --source ./home [source_file]
chezmoi add --source ./root  --destination / [source_file]
chezmoi add --template --source ./home [source_file]
chezmoi add --template --source ./root --destination / [source_file]

chezmoi target-path --source ./home [source_file]
```

[Other dotfile managers](https://dotfiles.github.io/utilities/):

- [dotbot](https://github.com/anishathalye/dotbot)
- [yadm](https://github.com/TheLocehiliosan/yadm)
