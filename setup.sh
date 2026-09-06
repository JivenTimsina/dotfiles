#!/usr/bin/env bash

set -e # Exit on any error

# create symlinks
DOTFILES="$HOME/.dotfiles"
if [[ ! -d "$DOTFILES" ]]; then
  echo "Dotfiles folder not found at $DOTFILES"
  exit 1
fi

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
ln -sf "$DOTFILES/btop" ~/.config/btop
sudo ln -sf "$DOTFILES/nixos" /etc/nixos
