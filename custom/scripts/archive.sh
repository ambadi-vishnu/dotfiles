#!/bin/bash

#Installing Archive Utilities
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Archive Utilities..." >> ~/install-log.txt
sudo pacman -S --needed --noconfirm cpio || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package cpio" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm lzo || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package lzo" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm p7zip || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package p7zip" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm unrar || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package unrar" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm unzip || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package unzip" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm zip || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package zip" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm arj || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package arj" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm binutils || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package binutils" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm bzip2 || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package bzip2" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm gzip || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package gzip" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm lha || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package lha" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm lrzip || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package lrzip" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm lz4 || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package lz4" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm lzip || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package lzip" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm lzop || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package lzop" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm tar || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package tar" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm xdg-utils || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package xdg-utils" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm xz || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package xz" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm zstd || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package zstd" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm xarchiver || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package xarchiver" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Archive Utilities Installed" >> ~/install-log.txt