{ pkgs ? import <nixpkgs> {} }:

{
  inherit (pkgs)
    # Terminal
    nano
    curl
    wget
    onefetch          # neofetch for Git
    fastfetch         # System info, the new neofetch
    ipfetch           # Neofetch for IPs, AUR
    btop              # better htop
    starship          # terminal UI
    zoxide            # Better cd
    bash
    bash-completion
    nix-bash-completions
    bat               # Better cat
    tree
    multitail         # File viewer
    fzf               # Command-line fuzzy finder
    kitty             # Terminal emulator
    yakuake           # Drop down terminal emulator
    zellij            # Modern Tmux (terminal multiplexer)
    pciutils         # Computer utility info
    usbutils         # USB utility info
    udisks2          # AUR, command is udisksctl
    udiskie          # AUR, a user-level daemon for auto-mounting
  
    ## Fonts
    meslo-lgs-nf # font for starship
    #ttf-ms-fonts
    SDL2_ttf
    carlito
    dejavu_fonts
    #ttf-droid
    font-awesome
    hack-font
    liberation_ttf
    roboto
    roboto-mono
    ubuntu_font_family
  
    #noto-fonts
    #noto-fonts-emoji
    #adobe-source-code-pro-fonts
    #adobe-source-han-sans-kr-fonts
    #adobe-source-han-sans-cn-fonts
    #adobe-source-han-sans-jp-fonts
    #adobe-source-sans-fonts
    #awesome-terminal-fonts
    #xorg-fonts-encodings
    #cantarell-fonts
  
    ## Video/Audio and photo
    vlc           # Media Player
    handbrake
    obs-studio
    gcolor3
    gimp          # Alternative is: https://github.com/PintaProject/Pinta
    inkscape
    upscayl       # Image upscaler
    #vulkan-radeon # Required for above, CPU vendor specific
  
    ## Apps
    xournalpp             # Draving software
    kate                  # General GUI text editor
    evince                # Document viewer (PDF)
    #masterpdfeditor4      # PDF editor (non-free license)
    #texlivePackages.latex  #texlive-latex       # For xournalpp Latex
    #texlivePackages.collection-latexextra #texlive-latexextra  # For xournalpp Latex
  
    zoom
    #nomachine
    freetube      # Youtube client
    pika-backup   # Backup tool (automatic)
  
    ## Office Suite
    libreoffice-fresh
    onlyoffice-bin
  
    ## Browsers
    brave
    librewolf
    #thorium-browser-bin
  
    ## File Management
    okular            # PDF viewer
    zip               # Zip files
    ark               # GUI to compress or uncompress data
    nextcloud-client
  
    ## Email
    betterbird
    birdtray
  
    ## Programming
    git
    lazygit               # Git terminal UI
    pre-commit            # Pre-commit hooks for Git
    gnumake               # make
    python3
    #python-pip
    go
    nodejs
    # npm
    vscodium              # Main code editor
    bruno
    chezmoi
    gitleaks              # Check for leaks in git repos, scans all branches with all commit history 
    #terraform            # (non-free license)
    pyinfra               # The new Ansible

    ## Formatters
    #prettier

    ## Linters
    hadolint        # Used in VSCodium
    #python-pylint   # Used in VSCodium

    ## Tools
    gsmartcontrol
    gnome-disk-utility
    ventoy
    #popsicle-bin
    android-tools
    universal-android-debloater # CLI: uad-ng
    #distrobox          # Run any distribution on any Linux
    ##xorg-xhost         # xhost, dependency for prev
    audacity            # Sound
    corectrl            # GPU and CPU guvernor
    activitywatch       # Time monitoring
    apacheHttpd         # for htpasswd
    #superpaper         # Wallpaper
    stacer              # System monitoring GUI
    #appimagelauncher    # AUR, integrate appimages as apps, works after reboot
    rclone
    whois               # Contains mkpasswd
    filezilla
    droidcam            # Webcam emulator from Android
    lazydocker          # Docker container management, Portainer alternative
    gomplate            # Templating cli
    gnutar              # tar
    trash-cli           # Command line trashcan (recycle bin) interface
    meld                # Compare files
    chafa               # ASCII art
    speedtest-go        # Internet speedtest in CLI
    drawio              # Drawing tool
    kcalc               # Calculator
    flameshot    # alt: satty       # Screenshot tool
    rofi-wayland        # Rofi with Wayland support
  
    ## Desktop environment
    copyq # clipboard manager
  
    ## Security
    keepassxc
    onlykey             # Includes udev rules
    openssh             # ssh-agent
    #gnome-ssh-askpass4-git # AUR, ssh-askpass-fullscreen is actually fullscreen
  
    ## Containers
    docker
    docker-compose

    ## QEMU
#   qemu_full # TODO: won't build
    virt-manager

    ## Printer and scanner
    simple-scan   # Scanning (Gnome)
    cups
    hplip
    sane-airscan
    avahi         # Network scanning (printer and scanner)

    ## System
    ntp       # time
    nftables  # firewall
    iptables-nftables-compat; # iptables to nftables layer, required for Docker
}