#!/bin/sh

SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"

FILE="$SAVE_DIR/screenshot-$(date +%Y%m%d-%H%M%S).png"

# Take screenshot
grim "$FILE" || exit 1

# Copy to clipboard
wl-copy < "$FILE" || exit 1

# Send notification with image preview
notify-send -i "file://$FILE" "Screenshot Captured" "Copied to clipboard"

