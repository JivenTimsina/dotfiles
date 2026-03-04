#!/bin/sh

# $1 = direction: "next" or "prev"
max_ws=7
min_ws=1

current_ws=$(swaymsg -t get_workspaces | jq '.[] | select(.focused).num')
if [ "$1" = "next" ]; then
    target_ws=$((current_ws + 1))
    [ "$target_ws" -gt $max_ws ] && target_ws=$max_ws
else
    target_ws=$((current_ws - 1))
    [ "$target_ws" -lt $min_ws ] && target_ws=$min_ws
fi

swaymsg move container to workspace number $target_ws
swaymsg workspace number $target_ws

