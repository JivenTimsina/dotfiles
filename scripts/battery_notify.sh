#!/bin/bash

# Levels to trigger at
CRITICAL=5
LOW=10
WARNING=15

while true; do
    # Get battery capacity and status (Change BAT0 if yours is BAT1)
    BATTERY_PATH="/sys/class/power_supply/BAT0"
    CAPACITY=$(cat "$BATTERY_PATH/capacity")
    STATUS=$(cat "$BATTERY_PATH/status")

    # Only notify if discharging
    if [ "$STATUS" = "Discharging" ]; then
        if [ "$CAPACITY" -le "$CRITICAL" ]; then
            notify-send -u critical -a "System" "Battery Critical" "Battery is at ${CAPACITY}%! Plug in now."
            sleep 60 # Don't spam
        elif [ "$CAPACITY" -le "$LOW" ]; then
            notify-send -u critical -a "System" "Battery Low" "Battery is at ${CAPACITY}%."
            sleep 300 
        elif [ "$CAPACITY" -le "$WARNING" ]; then
            notify-send -u normal -a "System" "Battery Warning" "Battery is at ${CAPACITY}%."
            sleep 600
        fi
    fi
    sleep 60 # Check every minute
done
