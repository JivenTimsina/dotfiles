#!/usr/bin/env bash

grim -g "$(slurp -p)" -t ppm - | magick - -format '%[pixel:p{0,0}]' txt:- |          tail -n 1 | awk '{print $3}' | wl-copy && notify-send "Copied to Clipboard $(wl-paste)"
