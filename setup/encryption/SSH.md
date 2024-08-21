# SSH

```sh
 ssh-keygen -t ed25519 -C "<comment>" -f ~/Desktop/ssh_key.pem
# space (' ') at start prevents it from being saved in history

# remove all ssh keys
ssh-add -D

# list keys
ssh-add -L

# show signature (must be in a git repo)
git show --show-signature
```
