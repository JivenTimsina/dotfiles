#!/bin/bash

set -e # Exit on any error

# create symlinks
DOTFILES="$HOME/.dotfiles"
if [[ ! -d "$DOTFILES" ]]; then
  echo "Dotfiles folder not found at $DOTFILES"
  exit 1
fi

echo "Creating symlinks..."

ln -sf "$DOTFILES/wezterm/wezterm.lua" ~/.wezterm.lua
ln -sf "$DOTFILES/nvim" ~/.config/nvim
ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/vim/vimrc" ~/.vimrc
ln -sf "$DOTFILES/fastfetch" ~/.config/fastfetch
ln -sf "$DOTFILES/zathura" ~/.config/zathura
ln -sf "$DOTFILES/kitty" ~/.config/kitty
sudo ln -sf "$DOTFILES/greetd" /etc/greetd
sudo ln -sf "$DOTFILES/i3status-rust" ~/.config/i3status-rust
sudo ln -sf "$DOTFILES/mako" ~/.config/mako
sudo ln -sf "$DOTFILES/sway" ~/.config/sway
sudo ln -sf "$DOTFILES/swaylock" ~/.config/swaylock
sudo ln -sf "$DOTFILES/yazi" ~/.config/yazi

