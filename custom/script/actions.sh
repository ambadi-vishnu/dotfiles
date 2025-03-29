#!/bin/bash

#Remove Existing Emoji File
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Removing Existing Emoji File..." >> ~/install-log.txt
sudo rm -rf /usr/share/rofi-emoji/all_emojis.txt || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Removing Existing Emoji File" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Removed Existing Emoji File" >> ~/install-log.txt

#Copy New Emoji File
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Copying New Emoji File..." >> ~/install-log.txt
sudo cp -rf ~/temp/dotfiles/custom/files/all_emojis.txt /usr/share/rofi-emoji/ || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying New Emoji File" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: New Emoji File Copied" >> ~/install-log.txt

#Update Font Cache
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Updating Font Cache..." >> ~/install-log.txt
fc-cache -fv || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed To Update Font Cache" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Font Cache Updated" >> ~/install-log.txt

#Activate Bluetooth Service
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Activating Bluetooth Service..." >> ~/install-log.txt
sudo systemctl enable bluetooth.service || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Enabling bluetooth.service" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success:  Bluetooth Service Activated" >> ~/install-log.txt

#Generate KDE Menu
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Generating KDE Menu..." >> ~/install-log.txt
XDG_MENU_PREFIX=arch- kbuildsycoca6 || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Generating KDE Menu" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success:  KDE Menu Generated" >> ~/install-log.txt