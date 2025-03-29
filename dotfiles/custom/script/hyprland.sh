#!/bin/bash

#Install Hyprland - AUR
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Hyprland..." >> ~/install-log.txt
yay -S --needed --noconfirm hyprland-meta-git || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Hyprland Installation Failed" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Hyprland Installed" >> ~/install-log.txt

#Install Hyprland Missing Packages - AUR
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Additional Hyprland Packages..." >> ~/install-log.txt
yay -S --needed --noconfirm hyprland-protocols-git || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package hyprland-protocols-git" >> ~/install-log.txt; exit 1; }
yay -S --needed --noconfirm hyprwayland-scanner-git || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package hyprwayland-scanner-git" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Additional Hyprland Packages Installed" >> ~/install-log.txt