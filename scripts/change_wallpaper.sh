#!/bin/bash

WALLPAPERS_DIR="$HOME/.dotfiles/wallpapers/wall"

# choose random image from the WALLPAPERS_DIR and change wallpaper
IMG=$(find "$WALLPAPERS_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)
swww img "$IMG" --transition-type any --transition-fps 60 --transition-duration 2 
