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

installPackage() {
      local pkg=$1	
	if [[ $(pacman -Q "${pkg}" 2>/dev/null) ]]; then
		success_message "${pkg} is already installed"
	fi
	yay -S --needed --noconfirm --answerclean All --answerdiff None "${pkg}"
	success_message "${pkg} successfully installed!"
}

installYay() {

	read -p "Do you want configure yay? (y/n) default:y" answ
	answ=${answ:-y}

	if [[ "$answ" == "y" ]]; then


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
	else
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
 	 		makepkg -si --noconfirm
  			cd $whereami
  			rm -rf ~/Downloads/yay
  			success_message "yay has been installed successfully"
		fi
	fi

}


read -p "Do you install everything without choosing (ghostty, zsh, oh-my-posh, stow)? (y/n, default:y)" firstQuestion
firstQuestion=${firstQuestion:-y}


if [[ "$firstQuestion" == "y" ]]; then
	clear
	installYay
	sleep 1
	clear
	
	info_message "Installing Ghostty terminal..."
	sleep 3
	clear

	installPackage ghostty
	sleep 1
	clear
	


	info_message "Installing zsh..."
	sleep 3
	clear

	installPackage zsh
	sleep 1
	clear


	info_message "changing shell to zsh..."
	sleep 3
	clear

	chsh -s /bin/zsh
	success_message "Your shell is successfully set to zsh"
	sleep 1
	clear



	info_message "Installing oh my posh (prompt)..."
	sleep 3
	clear

	installPackage oh-my-posh
	sleep 1
	clear
	
	info_message "Installing stow..."
	sleep 3
	clear

	installPackage stow
	sleep 1
	clear
	
	info_message "Apllying stow..."
	sleep 3
	clear
	stow .	
	clear
	success_message "Stow applied successfully"
	clear

	success_message "Done, enjoy my terminal :)"
	sleep 3

else 

	installYay
	sleep 1
	clear
	
	read -p "Do you want Ghostty terminal? (y/n) default:y" answ
	answ=${answ:-y}

	if [[ "$answ" == "y" ]]; then

		info_message "Installing Ghostty terminal... (y/n) default:y"
		sleep 3
		clear

		installPackage ghostty
		sleep 1
		clear
	fi	

	read -p "Do you want to install zsh? (y/n) default:y" answ
	answ=${answ:-y}

	if [[ "$answ" == "y" ]]; then

		info_message "Installing zsh..."
		sleep 3
		clear

		installPackage zsh
		sleep 1
		clear
	fi

	read -p "Do you to change shell to zsh? (y/n) default:y" answ
	answ=${answ:-y}

	if [[ "$answ" == "y" ]]; then

		info_message "changing shell to zsh..."
		sleep 3
		clear
		

		while true; do
			chsh -s /bin/zsh
			if [[ $? -eq 0 ]]; then 
				success_message "shell changed successfully"
				break
			else 
				error_message "Failed to change shell. Please enter your password correctly."
			fi
		done
		sleep 1
		clear
	fi

	read -p "Do you want to install oh my posh (prompt) (y/n) default:y" answ
	answ=${answ:-y}
	
	if [[ "$answ" == "y" ]]; then

		info_message "Installing oh my posh (prompt)..."
		sleep 3
		clear

		installPackage oh-my-posh
		sleep 1
		clear
	fi

	read -p "Do you want to install stow and apply it? (y/n) default:y" answ
	answ=${answ:-y}
	
	if [[ "$answ" == "y" ]]; then

		info_message "Installing stow..."
		sleep 3
		clear

		installPackage stow
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
		sleep 3


