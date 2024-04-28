# GPG

Generate keys:

```sh
gpg --full-generate-key # Select RSA and 4096 size

gpg --list-secret-keys --keyid-format=long --with-keygrip

gpg --export-secret-keys [key-id] > ~/Desktop/private.gpg
gpg --export [key-id] > ~/Desktop/public.gpg

gpg --import [path]
```

Test:

```sh
killall gpg-agent # or
gpgconf --kill gpg-agent # or
gpg-connect-agent reloadagent /bye
echo test | gpg --armor --sign -u [FINGERPRINT]
```

> Use defaults, name should be random, comment should be usage.

Commands:

```sh
git-crypt init

git-crypt unlock
git-crypt lock

git-crypt add-gpg-user USER_ID
```

File `.gitattributes`:

```.gitattributes
.gitattributes !filter !diff

home/dot_config/rclone/rclone.conf filter=git-crypt diff=git-crypt
```

Sources:

- [Main guide](https://github.com/ShellCode33/ArchLinux-Hardened/blob/master/docs/HOW_TO_MANAGE_SECRETS.md)
- [KeePassXC Secrets Service](https://c3pb.de/blog/keepassxc-secrets-service.html)
- [pinentry](https://github.com/gpg/pinentry)
- [Agent forwarding](https://wiki.gnupg.org/AgentForwarding)
