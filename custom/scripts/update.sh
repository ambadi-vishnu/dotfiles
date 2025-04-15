#!/bin/bash

#Spicing Up Pacman
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Updating Pacman Conf..." >> ~/install-log.txt
sudo sed -i "/^#Color/c\Color\nILoveCandy 
/^#VerbosePkgLists/c\VerbosePkgLists 
/^#ParallelDownloads/c\ParallelDownloads = 5" /etc/pacman.conf || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed To Update pacman.conf" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Pacman Conf Updated" >> ~/install-log.txt

#Update System Packages
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Updating System Packages..." >> ~/install-log.txt
sudo pacman -Syu || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Updating System Packages" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: System Packages Updated" >> ~/install-log.txt