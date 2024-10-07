# Dotfiles

NOTE: Do not use this, as it is highly experimental! It uses Devbox global with manualy linked GPU (mesa) drivers that break if Arch mesa drivers are different. Fully moving to NixOS.

TODO:

```sh
https://0pointer.net/blog/unlocking-luks2-volumes-with-tpm2-fido2-pkcs11-security-hardware-on-systemd-248.html
https://wiki.mozilla.org/Security/Sandbox/SELinux
https://github.com/linrunner/TLP
https://github.com/probonopd/go-appimage
```

On new system:

```bash
./bootstrap.sh

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

```sh
chezmoi data # List template variables
chezmoi execute-template '{{ .chezmoi.hostname }}' # Test them

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
