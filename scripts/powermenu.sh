#!/usr/bin/env bash

# Power menu for Sway WM using fzf
# Usage: bind this script to a key in your sway config
#   bindsym $mod+Shift+e exec ~/path/to/powermenu.sh

declare -A ACTIONS=(
    ["  Sleep"]="systemctl suspend"
    ["  Restart"]="systemctl reboot"
    ["  Shutdown"]="systemctl poweroff"
    ["󰍃  Logout"]="swaymsg exit"
)

OPTIONS="  Sleep\n  Restart\n  Shutdown\n󰍃  Logout"

CHOICE=$(printf "$OPTIONS" | fzf \
    --prompt=" Power Menu  " \
    --height=40% \
    --layout=reverse \
    --border=rounded \
    --border-label="  System " \
    --border-label-pos=3 \
    --color="bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8" \
    --color="fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc" \
    --color="marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8" \
    --color="border:#6c7086,label:#cba6f7" \
    --no-info \
    --no-scrollbar \
    --margin=1,2 \
    --pointer="▶" \
    --no-multi)

# Exit if no selection was made (Esc pressed)
[[ -z "$CHOICE" ]] && exit 0

# Confirm before executing destructive actions
case "$CHOICE" in
    "  Shutdown"|"  Restart"|"󰍃  Logout")
        CONFIRM=$(printf "Yes\nNo" | fzf \
            --prompt=" Confirm ${CHOICE##* }?  " \
            --height=20% \
            --layout=reverse \
            --border=rounded \
            --color="bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8" \
            --color="fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc" \
            --color="marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8" \
            --color="border:#6c7086,label:#cba6f7" \
            --no-info \
            --no-scrollbar \
            --margin=1,2 \
            --pointer="▶")
        [[ "$CONFIRM" != "Yes" ]] && exit 0
        ;;
esac

# Execute the selected action
eval "${ACTIONS[$CHOICE]}"
