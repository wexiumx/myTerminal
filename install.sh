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


# ----------------------------------------------------------
# Create required folders
# ----------------------------------------------------------

mkdir -p ~/.config/fasfetch
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/ohmyposh

# --------------------------------------------------------------------
# Ask if the user wants to do a backup of the current .config folder
# --------------------------------------------------------------------

info_message "Do you want to backup your current .config directory? (y/n, default: y): "
read backup_choice
backup_choice=${backup_choice:-y}  # Default to 'y' if empty
if [[ "$backup_choice" == "y" ]]; then
	mkdir -p ~/.config/terminal_backup
	mv ~/.config/fastfetch ~/.config/terminal_backup
	mv ~/.config/ghostty ~/.config/terminal_backup
	mv ~/.config/nvim ~/.config/terminal_backup
	mv ~/.config/ohmyposh ~/.config/terminal_backup
	success_message "Backup of .config created at ~/config_backup"
fi











