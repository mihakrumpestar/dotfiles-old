# Storage

Rclone:

```bash
rclone obscure

# Test
rclone mount nextcloud-personal: /mnt/nextcloud_personal  --config /etc/rclone.conf --allow-other --vfs-cache-mode full --cache-dir /var/rclone
```

Force unmount:

```sh
ls -al [path]

sudo umount -f [path]
sudo fusermount -u [path]
sudo fusermount -uz [path]
```
