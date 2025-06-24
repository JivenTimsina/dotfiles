#!/bin/bash

packages=(
    hyprland
    waybar
    wezterm
    zsh
    greetd-tuigreet

)

#symlinks
# wezterm
ln -sf ~/.dotfiles/.wezterm.lua ~/.wezterm.lua

# neovim
ln -sf ~/.dotfiles/nvim ~/.config/nvim

#zsh
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc

#vim
ln -sf ~/.dotfiles/.vimrc ~/.vimrc

#hyprland
ln -sf ~/.dotfiles/hypr ~/.config/hypr

#waybar
ln -sf ~/.dotfiles/waybar ~/.config/waybar

# fastfetch
ln -sf ~/.dotfiles/fastfetch ~/.config/fastfetch

#dunst
ln -sf ~/.dotfiles/dunst ~/.config/dunst

#rofi
ln -sf ~/.dotfiles/rofi ~/.config/rofi

#jome
ln -sf ~/.dotfiles/jome ~/.config/jome

#tofi
ln -sf ~/.dotfiles/tofi ~/.config/tofi

#greed needs sudo previlage
sudo ln -sf ~/.dotfiles/greetd /etc/greetd
