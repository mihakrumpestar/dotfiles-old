# Archinstall

Get [Arch](https://archlinux.org/download/) on drive using Ventoy.

Wipe prev disk first:

```sh
lsblk -f

wipefs -a /dev/[disk]

# Or if you need to shread

shred -vfzn 0 /dev/[disk]
```

Networking:

```sh
ip a
```

Mount drive with config (can't be the one with the ISO):

```sh
lsblk -f

mount --mkdir /dev/[drive] /mnt/[drive]
```

Run installer:

```sh
archinstall --config /mnt/[drive]/user_configuration.json --creds /mnt/[drive]/user_credentials.json
```
