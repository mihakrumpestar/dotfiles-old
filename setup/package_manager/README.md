# Package manager

Find packages [here](https://pkgs.org/).

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
