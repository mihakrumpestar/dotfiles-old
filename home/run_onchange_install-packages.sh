#!/bin/bash

echo -e "\n\e[1m Install user packages \e[0m\n"

yay -Syyu --noconfirm --quiet

PACKAGES=(
  # Terminal
  clinfo            # OpenGL GPU validator
  onefetch          # neofetch for Git
  fastfetch         # System info, the new neofetch
  ipfetch-git       # Neofetch for IPs, AUR
  btop              # better htop
  starship          # terminal UI
  ttf-meslo-nerd-font-powerlevel10k # font for starship

  # Video/Audio and photo
  vlc           # Media Player
  handbrake
  obs-studio
  gcolor3
  gimp
  inkscape
  upscayl-bin   # AUR, image upscaler
  vulkan-radeon # Required for above, CPU vendor specific

  # Apps
  xournalpp             # Draving software
  kate                  # General GUI text editor
  evince                # Document viewer (PDF)
  masterpdfeditor-free  # AUR, PDF editor

  extra/texlive-latex       # For xournalpp Latex
  extra/texlive-latexextra  # For xournalpp Latex

  zoom      # AUR
  nomachine # AUR
  freetube-bin # AUR, Youtube client
  pika-backup # AUR, backup tool (automatic)

  # Office Suite
  libreoffice-fresh
  onlyoffice-bin    # AUR

  # Browsers
  brave-bin     # AUR
  librewolf-bin # AUR
  # thorium-browser-bin # AUR

  # File Management
  okular            # PDF viewer
  zip               # Zip files
  ark               # GUI to compress or uncompress data
  nextcloud-client

  # Email
  betterbird-bin # AUR
  birdtray # AUR

  # Programming
  git
  make                  # gnumake
  python
  python-pip
  go
  nodejs
  npm
  vscodium-bin          # AUR, main code editor
  bruno-bin             # AUR
  chezmoi
  beekeeper-studio-bin  # AUR, SQLite
  git-crypt             # AUR
  gitleaks              # Check for leaks in git repos, scans all branches with all commit history 
  terraform

  # Formatters
  prettier

  # Linters
  hadolint-bin          # AUR, used in VSCodium
  python-pylint         # Used in VSCodium

  # Tools
  gsmartcontrol
  gnome-disk-utility
  ventoy-bin          # AUR
  popsicle-bin        # AUR
  android-tools
  universal-android-debloater # AUT: uad-ng
  distrobox           # Run any distribution on any Linux
  xorg-xhost          # xhost, dependency for prev
  audacity            # Sound
  corectrl            # GPU and CPU guvernor
  activitywatch-bin   # time monitoring, AUR
  apache              # for htpasswd
  superpaper          # AUR, wallpaper
  stacer-bin          # AUR, system monitoring GUI
  appimagelauncher    # AUR, integrate appimages as apps, works after reboot
  rclone
  whois               # Contains mkpasswd
  filezilla
  droidcam            # Webcam emulator from Android
  lazydocker-bin      # AUR, docker container management, Portainer alternative
  gomplate-bin        # AUR, templating cli

  # Desktop environment
  copyq # clipboard manager

  # Security
  keepassxc
  onlykey             # Includes udev rules, AUR
  openssh             # ssh-agent
  gnome-ssh-askpass4-git # AUR, ssh-askpass-fullscreen is actually fullscreen

  # Containers
  docker
  docker-compose

  # Printer and scanner
  simple-scan   # Scanning (Gnome)
)

# the quotes are needed to preserve params with spaces
yay -S --noconfirm --needed --quiet "${PACKAGES[@]}"

# Golang
go install github.com/go-task/task/v3/cmd/task@latest # Task runner, Makefile replacement

# Python
pipx install pyinfra

sudo npm i -g prettier-plugin-sh prettier-plugin-toml prettier-plugin-go-template

# Docker
sudo groupadd -f docker
sudo usermod -aG docker $USER
sudo systemctl enable --now docker

# Agent
systemctl --user enable --now ssh-agent

# Mount remote storage
loginctl enable-linger $USER
systemctl --user enable --now rclone@nextcloud-personal
# rclone listremotes

# Symbolic links
sudo ln -sf /usr/lib/ssh/gnome-ssh-askpass4 /usr/lib/ssh/x11-ssh-askpass
