#!/bin/bash

# Define the wallpaper folder
WALLPAPER_FOLDER="/home/vishnu/resources/backgrounds"

# Select a random image from the folder
SELECTED_WALLPAPER=$(find "$WALLPAPER_FOLDER" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

# Check if a wallpaper was found
if [ -z "$SELECTED_WALLPAPER" ]; then
    notify-send -t 3000 "Folder Empty" "No Images Found"
    exit 1
fi

# Set the wallpaper using swww
swww img "$SELECTED_WALLPAPER"

# Send a desktop notification
notify-send -t 3000 -i /home/vishnu/.config/swaync/icons/picture.png "Wallpaper Updated" "$(basename "$SELECTED_WALLPAPER")"