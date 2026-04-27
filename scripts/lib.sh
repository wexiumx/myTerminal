# ----------------------------------------------------------
# Define message colors
# ----------------------------------------------------------

PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ----------------------------------------------------------
# Colored messages
# ----------------------------------------------------------

info_message() {
  echo -e "${PURPLE}$1${NC}"
}

success_message() {
  echo -e "${GREEN}$1${NC}"
}

error_message() {
  echo -e "${RED}$1${NC}"
}

# ----------------------------------------------------------
# Welcome message
# ----------------------------------------------------------

welcome_message() {
  clear
  echo -e "\t  _______                  _             _ "
  echo -e "\t |__   __|                (_)           | |"
  echo -e "\t    | | ___ _ __ _ __ ___  _ _ __   __ _| |"
  echo -e "\t    | |/ _ \ '__| '_ \` _ \| | '_ \ / _\` | |"
  echo -e "\t    | |  __/ |  | | | | | | | | | | (_| | |"
  echo -e "\t    |_|\___|_|  |_| |_| |_|_|_| |_|\__,_|_|"
  echo -e "\t                                         \n"


  echo -e "\t      Welcome to my terminal installer :)"
  echo -e "${NC}\n"
}

# ----------------------------------------------------------
# Finish setup
# ----------------------------------------------------------

finish_setup() {
  info_message "Welcome, $USER" "Thank you for downloading my terminal :)"
  info_message "Changing shell to zsh"
  chsh -s /bin/zsh
  success_message "Finished customizations. Please reboot to enjoy your new terminal"
  exit 0
}

# ----------------------------------------------------------
# Install packages
# ----------------------------------------------------------

installPackages() {
  for pkg; do
    if [[ $(pacman -Q "${pkg}" 2>/dev/null) ]]; then
      success_message "${pkg} is already installed"
      continue
    fi
    yay -S --needed --noconfirm --answerclean All --answerdiff None "${pkg}"
  done
}

installYay() {
  if command -v yay > /dev/null; then

      success_message "yay is installed. Skipping installation"
  else
      error_message "yay is not installed. Installing..."
      sleep 1
      sudo pacman -S --needed --noconfirm base-devel less
      whereami=$(pwd)
      git clone https://aur.archlinux.org/yay.git ~/Downloads/yay

      if [[ $? -ne 0 ]]; then
          error_message "Failed to clone yay repository. Aborting."
          exit 1
      fi

      cd ~/Downloads/yay
      makepkg -si
      cd $whereami
      rm -rf ~/Downloads/yay
      success_message "yay has been installed successfully"
  fi
}
