#!/bin/bash

# Define the directory containing wallpapers
WALLPAPER_DIR="/home/masoud/Pictures/Wallpapers"

# Select a random wallpaper from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper using feh
feh --bg-fill "$WALLPAPER"

