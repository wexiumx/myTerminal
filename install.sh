#!/usr/bin/env bash

PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

info_message() {
	echo -e "${PURPLE}$1${NC}"
}

success_message() {
	echo -e "${GREEN}$1${NC}"
}

error_message() {
	echo -e "${RED}$1${NC}"
}

installPackageByYay() {
  local pkg=$1
    if [[ $(pacman -Q "${pkg}" 2>/dev/null) ]]; then
      success_message "${pkg} is already installed"
    else
    	yay -S --needed --noconfirm --answerclean All --answerdiff None "${pkg}"
	fi
}

installPackageByPacman() {
	local pkg=$1
    if [[ $(pacman -Q "${pkg}" 2>/dev/null) ]]; then
      success_message "${pkg} is already installed"
    else
		sudo pacman -S ${pkg} 
	fi
}


installYay() {
		info_message "Installing yay..."

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
}



clear
installYay
sleep 1
clear

info_message "Installing Ghostty terminal..."
sleep 3
clear

installPackageByPacman ghostty
sleep 1
clear

info_message "Installing zsh..."
sleep 3
clear

installPackageByPacman zsh
sleep 1
clear


info_message "changing shell to zsh..."
sleep 3
clear

chsh -s /bin/zsh
success_message "Your shell is successfully set to zsh"
sleep 5
clear



info_message "Installing oh my posh (prompt)..."
sleep 3
clear

installPackageByYay oh-my-posh
sleep 1
clear

info_message "Installing stow..."
sleep 3
clear

installPackageByPacman stow
sleep 1
clear

info_message "Applying stow..."
sleep 3
clear
stow .	
clear
success_message "Stow applied successfully"
clear

success_message "Done, enjoy my terminal :)"
sleep 5