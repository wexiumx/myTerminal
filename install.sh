#!/usr/bin/env bash
set -e

# Detect distro
if [ -f /etc/os-release ]; then
    source /etc/os-release
    DISTRO=$ID
else
    echo "Cannot detect distro."
    exit 1
fi

echo "Detected distro: $DISTRO"

# Function to install packages
install_pkg() {
    local pkg=$1
    case $DISTRO in
        arch)
            sudo pacman -Syu --noconfirm $pkg
            ;;
        ubuntu|debian|linuxmint)
            sudo apt update
            sudo apt install -y $pkg
            ;;
        fedora)
            sudo dnf install -y $pkg
            ;;
        void)
            sudo xbps-install -Sy $pkg
            ;;
        nixos)
            nix-env -iA nixpkgs.$pkg
            ;;
        *)
            echo "Unsupported distro. Install $pkg manually."
            ;;
    esac
}

# Install dependencies
case $DISTRO in
    arch|ubuntu|debian|linuxmint|fedora|void)
        install_pkg git
        install_pkg curl
        install_pkg wget
        install_pkg go
        ;;
    nixos)
        install_pkg git
        install_pkg curl
        install_pkg wget
        ;;
esac

# Install Ghostty
echo "Installing Ghostty..."
curl -sSL https://github.com/charmbracelet/ghostty/releases/latest/download/ghostty-linux-amd64 -o /usr/local/bin/ghostty
chmod +x /usr/local/bin/ghostty

# Install Oh My Posh
echo "Installing Oh My Posh..."
if [[ "$DISTRO" == "arch" ]]; then
    sudo pacman -S --noconfirm oh-my-posh
else
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ~/.local/bin/oh-my-posh
    chmod +x ~/.local/bin/oh-my-posh
fi

echo "Installation completed."

