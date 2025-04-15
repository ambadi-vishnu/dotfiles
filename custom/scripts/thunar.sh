#!/bin/bash

#Install Thunar & Plugins
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Thunar & Plugins..." >> ~/install-log.txt
sudo pacman -S --needed --noconfirm thunar || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package thunar" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm thunar-archive-plugin || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package thunar-archive-plugin" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm thunar-media-tags-plugin || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package thunar-media-tags-plugin" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm thunar-shares-plugin || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package thunar-shares-plugin" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm thunar-vcs-plugin || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package thunar-vcs-plugin" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm thunar-volman || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package thunar-volman" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm xarchiver || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package xarchiver" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Thunar & Plugins Installed" >> ~/install-log.txt