#!/bin/bash

# Configuration
IMG_DIR="$HOME/resources/backgrounds"
STORAGE_FILE="$HOME/resources/temporary/wallpapers.txt"
CURRENT_INDEX_FILE="$HOME/resources/temporary/wallpaper_index"

# Ensure config directory and storage file exist
mkdir -p "$(dirname "$STORAGE_FILE")"
touch "$STORAGE_FILE"
touch "$CURRENT_INDEX_FILE"

# Step 1: Check for new images and update storage
find "$IMG_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.bmp" \) | while read -r img; do

    grep -Fxq "$img" "$STORAGE_FILE" || echo "$img" >> "$STORAGE_FILE"
done

# Step 2: Read current index
if [[ ! -s "$CURRENT_INDEX_FILE" ]]; then
    echo 0 > "$CURRENT_INDEX_FILE"
fi
INDEX=$(cat "$CURRENT_INDEX_FILE")

# Step 3: Get total number of images
TOTAL=$(wc -l < "$STORAGE_FILE")

# Safety check
if [[ "$TOTAL" -eq 0 ]]; then
    echo "No images found in $IMG_DIR"
    exit 1
fi

# Step 4: Get the image at the current index
IMAGE=$(sed -n "$((INDEX + 1))p" "$STORAGE_FILE")

# Step 5: Set wallpaper using swww
swww img "$IMAGE"

# Step 6: Send Notification
notify-send -t 3000 -i /home/vishnu/.config/swaync/icons/picture.png -a "Wallpaper Selector" "Wallpaper Updated" "$IMAGE"

# Step 7: Update index (wrap around if needed)
NEW_INDEX=$(( (INDEX + 1) % TOTAL ))
echo "$NEW_INDEX" > "$CURRENT_INDEX_FILE"