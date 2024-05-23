# Backup

- pika backup: has multiple target, can't restore directly, only temporary mount

Not suitable backup options:

- kopia: desktop and server UI, multiple folders per repo, but UI can accommodate only one repo at a time meaning you have to switch between them or have multiple instances running
- deja-dup: only one target, has restore, too simplistic
- duplicati: discouraged
- TimeShift: only full disk on btrfs
- KBackup: GUI lacks options, can't have multiple profiles at the same time
- rsnapshot: last release was dec 2022
- backintime: has its own system for backup that stores all files and permissions separately
- borg: no UI by itself (might use with https://github.com/Ravinou/borgwarehouse)

- restic: no UI by itself:

  - backrest: web
  - autorestic: CLI only
  - resticprofile: config that generates CLI
  - resticgui: does not support Rclone
  - backrest: best web UI server, also on desktop
  - resticity: gorgeous desktop client that can also work on server
  - resticguigx: less popular desktop app

- rustic: restic in rust
