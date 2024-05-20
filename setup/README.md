# Setup

Localization:

```bash
sudo locale-gen
locale
```

Shell prompt font:

```sh
# Get installed font full name
fc-list | grep -i Meslo

# Apply
exec bash
```

To add apps to startup:

```bash
cp /usr/share/applications/[APP_NAME].desktop ~/.config/autostart/
```

Icons are store under:

- `/usr/share/pixmaps/`: a 32x32 px XPM file
- `/usr/share/icons/hicolor/48x48/apps/`: a 48x48 px PNG file
- `/usr/share/icons/hicolor/scalable/apps/`: optionally, an SVG file

If you update the systemd files, reload systemctl:

```bash
systemctl --user daemon-reload
sudo systemctl daemon-reload
```

Undelete data:

```bash
sudo grep -a -C 70 -F 'search string of known things in file' /dev/sda2 > temp.log
```
