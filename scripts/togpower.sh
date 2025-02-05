#!/bin/bash

# Get the current profile
current_mode=$(powerprofilesctl get)

# Determine the next mode
if [[ "$current_mode" == "performance" ]]; then
    next_mode="balanced"
elif [[ "$current_mode" == "balanced" ]]; then
    next_mode="power-saver"
else
    next_mode="performance"
fi

# Set the new mode
powerprofilesctl set $next_mode

# Send a notification
notify-send "Power Profile" "$next_mode"

