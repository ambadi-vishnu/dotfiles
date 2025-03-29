#!/bin/bash

#Install yay
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing yay..." >> ~/install-log.txt
mkdir -p ~/aur || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Creating Directory aur" >> ~/install-log.txt; exit 1; }
cd ~/aur || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Changing Directory To aur" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed git base-devel || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Packages git, base-devel" >> ~/install-log.txt; exit 1; }
git clone https://aur.archlinux.org/yay.git || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Cloning yay" >> ~/install-log.txt; exit 1; }
cd ~/aur/yay || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Changing Directory To yay" >> ~/install-log.txt; exit 1; }
makepkg -si || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Making Package yay" >> ~/install-log.txt; exit 1; }
cd ~ || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Changing Directory To Home" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: yay Installed" >> ~/install-log.txt