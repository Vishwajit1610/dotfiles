# Dotfiles (Arch Linux / Hyprland)

Modular dotfiles managed via GNU Stow. Optimized for a Wayland/Arch ecosystem.


## Dependencies

Before deployment, ensure the following base system invariants are met:
*   **Core:** `stow`, `git`, `curl`, `zsh`
*   **Environment:** `hyprland`, `waybar`, `mako`, `wofi`
*   **Terminal/Editor:** `kitty`, `neovim`, `tmux`, `yazi`
*   **Fonts:** Nerd Fonts (required for Starship/Waybar rendering)

## Deployment (GNU Stow)

Clone the repository to your home directory:
```bash
git clone [https://github.com/Vishwajit1610/dotfiles.git](https://github.com/Vishwajit1610/dotfiles.git) ~/dotfiles
cd ~/dotfiles
```
Use stow to symlink specific packages to $HOME.
(Note: Ensure default configs like ~/.zshrc are deleted before stowing to prevent collision errors).
Bash

## Deploy shell environment
```bash
stow shell
```

## Deploy editor
```bash
stow nvim
```

## Deploy entire Wayland desktop suite
```bash
stow hyprland kitty terminal-utils
```
