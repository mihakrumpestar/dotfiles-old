# Package manager

Devbox (nix-env)

Packages:

- <https://search.nixos.org/packages>
- <https://www.nixhub.io/>

## Flakes

```sh
nix flake show /absolute/path/to/virtualhere-client
nix build /absolute/path/to/virtualhere-client
nix run /absolute/path/to/virtualhere-client
```

## Arch Linux (pacman and yay)

Mirror fix:

```bash
sudo pacman -S archlinux-keyring
```

Mirrors optimization:

```bash
sudo pacman -S rate-mirrors-bin

export TMPFILE="$(mktemp)"; \
sudo true; \
rate-mirrors --save=$TMPFILE arch --max-delay=43200 \
  && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
  && sudo mv $TMPFILE /etc/pacman.d/mirrorlist
```

Clean cache:

```sh
yes "y" | yay -Scc # Clean yay cache
```

## Comparison

Distro-agnostic package managers (stats of 16.8.2024):

- [Guix](https://packages.guix.gnu.org/): ~28k packages, based on nix package manager
- [Flatpak](https://ahayzen.com/direct/flathub.html#appcount): ~2.6k packages
- [AppImageHub](https://appimage.github.io/apps/): ~1.4k packages
- [Distrobox](https://distrobox.it/): too much manual work, packages from all distros, uses podman containers
- [apx](https://github.com/Vanilla-OS/apx): more straightforward Distrobox implementation, packages from all distros
- [Nix package manager](https://search.nixos.org/packages): over 100k packages

Find packages [here](https://pkgs.org/).
