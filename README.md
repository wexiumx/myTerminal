## Overview

A minimal, keyboard-driven terminal setup built around **Ghostty** and the **Catppuccin** color theme. Everything is tuned for speed and aesthetics.

This repository contains my personal terminal setup, featuring:

- **Ghostty** - Terminal
- **Zsh** - Shell
  - **Oh My Posh** - Prompt
  - **Zinit** - Plugin manager
  - **Fzf** - Fuzzy finder
  - **Zoxide** - Smart cd command
- **Nvim** - text editor
- **Tools**
  - **Eza** - modern ls
  - **Fd** - modern find
  - **Ripgrep** - modern grep
  - **Bat** - modern cat
  - **Navi** - cheat sheat for commands
  - **Lazygit** - git but more interactive
  - **Yazi** - terminal folder manager
  - **Btop** - program that shows processes


## Screenshots


![Terminal](./.screenshots/terminal-screenshot1.png)
![Nvim](./.screenshots/Nvim.png)


## Installation

To install this terminal configuration:

> [!IMPORTANT]
> I assume that you already have the `git` package installed. If not, what are you waiting for?

```bash
cd 
git clone https://github.com/wexiumx/terminal.git 
cd terminal
./install.sh
```

> [!WARNING]
> My script may not have applied zsh to your terminal, If that happens, run this command in your terminal `sudo chsh -s /bin/zsh`

The installation script will automatically set up all configurations and symlinks.


## Keybindings & Aliases

### Keybindings

| Keybinding | Action |
|------------|--------|
| `Ctrl + P` | Search history backward |
| `Ctrl + N` | Search history forward |
| `Ctrl + E` | Move to end of line (emacs mode) |
| `Ctrl + A` | Move to beginning of line (emacs mode) |
| `Ctrl + W` | Delete word backward |
| `Ctrl + U` | Delete to beginning of line |
| `Ctrl + R` | Fuzzy search shell history (fzf) |
| `Ctrl + T` | Fuzzy find files (fzf) |
| `Ctrl + F` | Open yazi file manager |
| `Alt + C`  | Fuzzy cd into directory (fzf) |
| `Tab`      | fzf-tab completion with preview |

### Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `ls` | `eza` | Modern ls |
| `ll` | `eza -lh --git` | Long list with git status |
| `la` | `eza -a` | List all including hidden |
| `lla` | `eza -lha --git` | Long list all with git status |
| `lst` | `eza --tree -L 99` | Full directory tree |
| `lsta` | `eza --tree -L 99 -a --ignore-glob='.git'` | Full tree including hidden, no .git |
| `lg` | `lazygit` | Interactive git TUI |
| `cat` | `bat` | Modern cat with syntax highlighting |
| `c` | `clear` | Clear terminal |
| `py` | `python` | Python shorthand |
| `.` | `cd ..` | Go up 1 directory |
| `..` | `cd ../..` | Go up 2 directories |
| `...` | `cd ../../..` | Go up 3 directories |
| `....` | `cd ../../../..` | Go up 4 directories |
| `.....` | `cd ../../../../..` | Go up 5 directories |
| `y` | yazi function | Open yazi, cd into chosen directory on exit |
