#!/bin/bash

#Install SDDM Packages
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing SDDM Packages..." >> ~/install-log.txt
sudo pacman --noconfirm --needed -S sddm || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package sddm" >> ~/install-log.txt; exit 1; }
sudo pacman --noconfirm --needed -S qt6-svg || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package qt6-svg" >> ~/install-log.txt; exit 1; }
sudo pacman --noconfirm --needed -S qt6-virtualkeyboard || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package qt6-virtualkeyboard" >> ~/install-log.txt; exit 1; }
sudo pacman --noconfirm --needed -S qt6-multimedia-ffmpeg || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package qt6-multimedia-ffmpeg" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: SDDM Packages Installed" >> ~/install-log.txt

#Configure SDDM Theme
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Configuring SDDM Theme..." >> ~/install-log.txt
sudo cp -rf ~/temp/dotfiles/joker /usr/share/sddm/themes/ || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying SDDM Theme" >> ~/install-log.txt; exit 1; }
sudo cp -rf /usr/share/sddm/themes/joker/sddm.conf /etc/ || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying SDDM Config" >> ~/install-log.txt; exit 1; }
sudo rm -rf /usr/share/sddm/themes/joker/sddm.conf || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Deleting SDDM Config" >> ~/install-log.txt; exit 1; }
sudo mkdir -p /usr/share/fonts/Electroharmonix || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Creating SDDM Font Directory" >> ~/install-log.txt; exit 1; }
sudo cp -rf /usr/share/sddm/themes/joker/Fonts/* /usr/share/fonts/Electroharmonix/ || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying SDDM Font" >> ~/install-log.txt; exit 1; }
sudo systemctl enable sddm.service || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Enabling sddm.service" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: SDDM Theme Configured" >> ~/install-log.txt