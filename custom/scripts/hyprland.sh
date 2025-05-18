#!/bin/bash

#Install Hyprland - AUR
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Hyprland..." >> ~/install-log.txt
yay -S --needed --noconfirm hyprland-meta-git || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Hyprland Installation Failed" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Hyprland Installed" >> ~/install-log.txt
