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
ln -sf "$DOTFILES/hypr" ~/.config/hypr
ln -sf "$DOTFILES/waybar" ~/.config/waybar
ln -sf "$DOTFILES/fastfetch" ~/.config/fastfetch
ln -sf "$DOTFILES/dunst" ~/.config/dunst
ln -sf "$DOTFILES/rofi" ~/.config/rofi
ln -sf "$DOTFILES/jome" ~/.config/jome
ln -sf "$DOTFILES/tofi" ~/.config/tofi
ln -sf "$DOTFILES/zathura" ~/.config/zathura
ln -sf "$DOTFILES/kitty" ~/.config/kitty
sudo ln -sf "$DOTFILES/greetd" /etc/greetd
