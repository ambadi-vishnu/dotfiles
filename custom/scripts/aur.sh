#!/bin/bash

#Installing Necessary Apps - Yay
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Necessary Applications - Yay..." >> ~/install-log.txt
yay -S --needed --noconfirm hyprshot-git || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package hyprshot-git" >> ~/install-log.txt; exit 1; }
yay -S --needed --noconfirm qt6ct-kde || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package qt6ct-kde" >> ~/install-log.txt; exit 1; }
yay -S --needed --noconfirm librewolf-bin || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package librewolf-bin" >> ~/install-log.txt; exit 1; }
yay -S --needed --noconfirm waybar-git || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package waybar-git" >> ~/install-log.txt; exit 1; }
yay -S --needed --noconfirm swww-git || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package swww-git" >> ~/install-log.txt; exit 1; }
yay -S --needed --noconfirm blueberry-wayland || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package blueberry-wayland" >> ~/install-log.txt; exit 1; }
yay -S --needed --noconfirm janus || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package janus" >> ~/install-log.txt; exit 1; }
yay -S --needed --noconfirm brightnessctl-git || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package brightnessctl-git" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Necessary Applications Installed - Yay" >> ~/install-log.txt