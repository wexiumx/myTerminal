#!/bin/bash

set -e
trap 'error_message "Script failed at line $LINENO"' ERR


# ----------------------------------------------------------
# Load the library and packages list
# ----------------------------------------------------------

source ./scripts/lib.sh
source ./scripts/packages.sh

# ----------------------------------------------------------
# Displaying welcome message
# ----------------------------------------------------------

welcome_message

sleep 2
clear


# --------------------------------------------------------------------
# Ask if the user wants to do a backup of the current .config folder
# --------------------------------------------------------------------

info_message "Do you want to backup your current .config directory? (y/n, default: y): "
read -r backup_choice
backup_choice=${backup_choice:-y}  # Default to 'y' if empty

if [[ "$backup_choice" == "y" ]]; then
    backup_dir="$HOME/.config/terminal_backup"
    mkdir -p "$backup_dir"

    for dir in fastfetch ghostty nvim ohmyposh; do
        if [ -d "$HOME/.config/$dir" ]; then
            mv "$HOME/.config/$dir" "$backup_dir/"
        fi
    done

    success_message "Backup created at $backup_dir"
fi


# ----------------------------------------------------------
# Create required folders
# ----------------------------------------------------------

info_message "creating required folders"

mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/ohmyposh

info_message "done!"
sleep 1

clear


# ----------------------------------------------------------
# Check if yay is installed. If not, installs it
# ----------------------------------------------------------

installYay

sleep 1
clear


# ----------------------------------------------------------
# Install packages
# ----------------------------------------------------------

info_message "installing packages"
sleep 1

installPackages "${shell[@]}"
installPackages "${tools[@]}"

clear

# ----------------------------------------------------------
# applying stow
# ----------------------------------------------------------

info_message "applying stow"
sleep 1

for dir in fastfetch ghostty nvim ohmyposh zsh; do
	stow "$dir"
done

clear


# ----------------------------------------------------------
# final message
# ----------------------------------------------------------

finish_setup
