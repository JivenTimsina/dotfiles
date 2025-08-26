#!/bin/bash

MAX_WS=7

# Get current workspace ID
current_ws=$(hyprctl activeworkspace -j | jq '.id')

# Calculate target
target_ws=$((current_ws + 1))

# Only switch if within allowed range
if ((target_ws <= MAX_WS)); then
  hyprctl dispatch workspace "$target_ws"
fi
yprctl dispatch workspace "$target_ws"
