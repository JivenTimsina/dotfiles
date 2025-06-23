#!/bin/bash

WALLPAPERS_DIR="$HOME/.dotfiles/nord-wallpaper"

# choose random image from the WALLPAPERS_DIR and change wallpaper
while true; do
    IMG=$(find "$WALLPAPERS_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)
    swww img "$IMG" --transition-type grow --transition-fps 60 --transition-duration 2 --transition-pos 0.5,0.5
    sleep 900 # 15 minutes
done
