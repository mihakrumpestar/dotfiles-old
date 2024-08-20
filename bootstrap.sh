#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
# Treat unset variables as an error when substituting.
# Exit if any command in a pipeline fails.
set -euo pipefail

# Function to log messages
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Nix
install_nix() {
    log "Installing Nix..."
    if command_exists nix; then
        log "Nix is already installed. Skipping installation."
    else
        curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
        log "Nix installed successfully."
    fi
}

# Setup Nix users
setup_nix_users() {
    log "Setting up Nix users..."
    sudo groupadd -f nix-users
    sudo usermod -aG nix-users "$USER"
    sudo systemctl enable --now nix-daemon.service
    log "Nix users setup completed."
}

# Install Devbox
install_devbox() {
    log "Installing Devbox..."
    if command_exists devbox; then
        log "Devbox is already installed. Skipping installation."
    else
        curl -fsSL https://get.jetify.com/devbox | FORCE=1 bash
        log "Devbox installed successfully."
    fi
}

# Setup Devbox configuration
setup_devbox_config() {
    log "Setting up Devbox configuration..."
    local config_dir="$HOME/.local/share/devbox/global/default"
    mkdir -p "$config_dir"
    cp --update home/dot_local/share/devbox/global/default/devbox.json "$config_dir/devbox.json"
    devbox global install
    log "Devbox configuration completed."
}

# Apply without secrets
apply_without_secrets() {
    log "Applying without secrets..."
    if command_exists go-task; then
        go-task apply-without-secrets
        log "Applied without secrets successfully."
    else
        log "Error: go-task is not installed. Please install it and try again."
        exit 1
    fi
}

# Main execution
main() {
    log "Starting setup process..."

    install_nix
    setup_nix_users
    install_devbox
    setup_devbox_config
    cp --update home/dot_config/chezmoi/chezmoi.yaml ~/.config/chezmoi/chezmoi.yaml
    apply_without_secrets

    log "Setup process completed successfully."
}

# Run the main function
main