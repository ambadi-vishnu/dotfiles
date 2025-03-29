#!/bin/bash

#Installing MTP Tweaks
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing MTP Tweaks..." >> ~/install-log.txt
sudo pacman -S --needed --noconfirm mtpfs || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package mtpfs" >> ~/install-log.txt; exit 1; }
yay -S --needed --noconfirm jmtpfs || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package jmtpfs" >> ~/install-log.txt; exit 1; }
sudo pacman -Sy --needed --noconfirm gvfs-mtp || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package gvfs-mtp" >> ~/install-log.txt; exit 1; }
sudo pacman -Sy --needed --noconfirm gvfs-gphoto2 || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package gvfs-gphoto2" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: MTP Tweaks Installed" >> ~/install-log.txt