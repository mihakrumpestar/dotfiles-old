# Backup

Not suitable backup options:

- deja-dup: only one target, has restore, too simplistic
- pika backup: has multiple target, can't restore only temporary mount
- duplicati: discouraged
- TimeShift: only full disk on btrfs
- KBackup: GUI lacks options, can't have multiple profiles at the same time
- rsnapshot: last release was dec 2022
- backintime: has its own system for backup that stores all files and permissions separately
- borg: no UI by itself (might use with https://github.com/Ravinou/borgwarehouse)
