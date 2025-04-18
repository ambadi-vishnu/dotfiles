#!/bin/bash

#Install Rate-Mirrors
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Rate-Mirrors..." >> ~/install-log.txt
yay -S rate-mirrors-bin --noconfirm || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package rate-mirrors" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Rate-Mirrors Installed" >> ~/install-log.txt

#Update Pacman Mirrorlist
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Updating Pacman Mirrorlist..." >> ~/install-log.txt
rate-mirrors --protocol https arch | sudo tee /etc/pacman.d/mirrorlist || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Updating Mirrorlist" >> ~/install-log.txt; exit 1; }
sudo pacman -Syy || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Syncing Package Database" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Pacman Mirrorlist Updated" >> ~/install-log.txt
