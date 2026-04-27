#!/bin/bash

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
read backup_choice
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

mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/ohmyposh



# ----------------------------------------------------------
# Check if yay is installed. If not, installs it
# ----------------------------------------------------------

if command -v yay > /dev/null; then
  success_message "yay is installed. Skipping installation"
else
  error_message "yay is not installed. Installing..."
  sleep 1
  sudo pacman -S --needed --noconfirm base-devel less
  whereami=$(pwd)
  git clone https://aur.archlinux.org/yay.git ~/Downloads/yay
  cd ~/Downloads/yay
  makepkg -si
  cd $whereami
  rm -rf ~/Downloads/yay
  success_message "yay has been installed successfully"
fi

sleep 1
clear


# ----------------------------------------------------------
# Install packages
# ----------------------------------------------------------

installPackages "${shell[@]}"
installPackages "${tools[@]}"










