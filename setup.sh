#!/bin/bash

set -e # Exit on any error

#install base-devel and git if not already present
sudo pacman -S --needed --noconfirm git base-devel

# yay
if ! command -v yay &>/dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    #build and install yay
    cd /tmp/yay
    makepkg -si --noconfirm
    #clean up
    cd ~
    rm -rf /tmp/yay
fi

packages=(
    git
    curl
    hyprland-git
    hypridle
    wezterm
    vim
    neovim
    obsidian
    hyprpicker
    discord
    spotify
    zsh
    greetd-tuigreet
    fastfetch
    zen-browser
    swww
    tofi
    dunst
    jome
    rofi-lbonn-wayland
)

#install packages
echo "Installing packages..."
yay -S --noconfirm "${packages[@]}"

echo "Changing default shell to zsh..."
#change shell
chsh -s "$(which zsh)"

# Disable conflicting display managers
echo "Disabling common display managers..."
sudo systemctl disable sddm.service lightdm.service gdm.service ly.service 2>/dev/null

# enable greetd
echo "Enabling greetd-tui..."
sudo systemctl enable greetd.service
sudo systemctl start greetd.service

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
sudo ln -sf "$DOTFILES/greetd" /etc/greetd
