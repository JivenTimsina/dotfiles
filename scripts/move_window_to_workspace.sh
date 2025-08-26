#!/bin/bash

# ====== Configuration ======
MIN_WS=1
MAX_WS=7
DIRECTION="$1"

# ====== Get current workspace ID ======
current_ws=$(hyprctl activeworkspace -j | jq '.id')

# ====== Calculate target ======
if [[ "$DIRECTION" == "r+1" ]]; then
  target_ws=$((current_ws + 1))
elif [[ "$DIRECTION" == "r-1" ]]; then
  target_ws=$((current_ws - 1))
else
  echo "Usage: $0 r+1 | r-1"
  exit 1
fi

# ====== Check bounds ======
if ((target_ws < MIN_WS || target_ws > MAX_WS)); then
  # Out of range: do nothing
  exit 0
fi

# ====== Move active window ======
hyprctl dispatch movetoworkspace "$target_ws"
