#!/usr/bin/env bash

set -e # Exit on any error

# exec as sudo
if [[ $EUID -ne 0 ]]; then
    exec sudo "$0" "$@"
fi

# create symlinks
DOTFILES="$HOME/.dotfiles"
if [[ ! -d "$DOTFILES" ]]; then
  echo "Dotfiles folder not found at $DOTFILES"
  exit 1
fi

echo "Creating symlinks..."

ln -sfn "$DOTFILES/nixos" /etc/nixos
ln -sf "$DOTFILES/wezterm/wezterm.lua" ~/.wezterm.lua
ln -sf "$DOTFILES/nvim" ~/.config/nvim
ln -sf "$DOTFILES/zsh/zshrc" ~/.zshrc
ln -sf "$DOTFILES/vim/vimrc" ~/.vimrc
ln -sf "$DOTFILES/zathura" ~/.config/zathura
ln -sf "$DOTFILES/kitty" ~/.config/kitty
ln -sf "$DOTFILES/i3status-rust" ~/.config/i3status-rust
ln -sf "$DOTFILES/mako" ~/.config/mako
ln -sf "$DOTFILES/sway" ~/.config/sway
ln -sf "$DOTFILES/swaylock" ~/.config/swaylock
ln -sf "$DOTFILES/yazi" ~/.config/yazi
