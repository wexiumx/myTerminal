# My terminal configuration

A minimal and efficient terminal configuration for Arch Linux and Arch-based distributions.

## Overview

This repository contains my personal terminal setup, featuring:

- **Ghostty** - Terminal
- **Zsh** - Shell
  - **Zinit** - Plugin manager
  - **fzf** - Fuzzy finder
  - **Zoxide** - Smarter cd command
- **Oh My Posh** - Prompt


## Installation

To install this terminal configuration:

> [!IMPORTANT]
> I asume that you already have the 'git' package installed. If not, what are you waiting for?

```bash
git clone https://github.com/wexiumx/myTerminal.git ~/
cd ~/myTerminal
./install.sh
```

> [!WARNING]
> My script may didn't applied zsh to your terminal, if that happened put this command in your terminal 'sudo chsh -s /bin/zsh'

The installation script will automatically set up all configurations and symlinks.

## Post-Installation

to apply your new terminal you would need to reboot to apply changes
