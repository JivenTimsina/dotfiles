#!/bin/bash

# Ensure the daemon is responsive
until awww query &> /dev/null; do
    sleep 0.1
done

WALLPAPERS_DIR="$HOME/.dotfiles/wallpapers/wall"

# choose random image from the WALLPAPERS_DIR and change wallpaper
IMG=$(find "$WALLPAPERS_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)
awww img "$IMG" --transition-type any --transition-fps 60 --transition-duration 2
