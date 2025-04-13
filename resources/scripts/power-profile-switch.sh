#!/bin/bash

# Get the current power profile
current_profile=$(powerprofilesctl get)

# Switch to the next profile
case "$current_profile" in
  performance)
    powerprofilesctl set balanced
        notify-send -t 3000 -i /home/vishnu/.config/swaync/icons/bolt.png -a "Power Mode" "Power Profile" "Balanced Mode ON"
    ;;
  balanced)
    powerprofilesctl set power-saver
        notify-send -t 3000 -i /home/vishnu/.config/swaync/icons/bolt.png -a "Power Mode" "Power Profile" "Power Saver Mode ON"
    ;;
  power-saver)
    powerprofilesctl set performance
        notify-send -t 3000 -i /home/vishnu/.config/swaync/icons/bolt.png -a "Power Mode" "Power Profile" "Performance Mode ON"
    ;;
  *)
        notify-send -t 3000 -i /home/vishnu/.config/swaync/icons/bolt.png -a "Power Mode" "Power Profile" "Unknown Error"
    ;;
esac