#!/bin/bash

# Define the directory containing wallpapers
WALLPAPER_DIR="/home/masoud/Pictures/Wallpapers"

# Check if the script is already running, if so, kill it
if pidof -x "$(basename "$0")" -o $$ > /dev/null; then
    exit 1
fi

# Run the script
while true; do
    # Select a random wallpaper from the directory
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    # Set the wallpaper using feh
    feh --bg-fill "$WALLPAPER"

    # Wait for 10 minutes before changing the wallpaper again
    sleep 600
done

