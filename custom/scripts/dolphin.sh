#!/bin/bash

#Installing Dolphin & KDE Modules
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Dolphin & KDE Modules..." >> ~/install-log.txt
sudo pacman -S --needed --noconfirm ark || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package ark" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm dolphin || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package dolphin" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm kio-admin || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package kio-admin" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm archlinux-xdg-menu || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package archlinux-xdg-menu" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Dolphin & KDE Modules Installed" >> ~/install-log.txt

#ServiceMenus Directory Check
if [ ! -d "$HOME/.local/share/kservices5/ServiceMenus" ]; then
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Creating ServiceMenus Directory..." >> ~/install-log.txt
    mkdir -p "$HOME/.local/share/kservices5/ServiceMenus" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Creating Directory ServiceMenus" >> ~/install-log.txt; exit 1; }
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Created Directory ServiceMenus" >> ~/install-log.txt
else
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Message: ServiceMenus Directory Already Exist" >> ~/install-log.txt
fi

#Copy Dolphin Config Files
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Copying Dolphin Config Files..." >> ~/install-log.txt
cp -rf ~/temp/dotfiles/custom/files/kitty.desktop "$HOME/.local/share/kservices5/ServiceMenus/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying kitty.desktop To Directory ServiceMenus" >> ~/install-log.txt; exit 1; }
cp -rf ~/temp/dotfiles/custom/files/arkrc "$HOME/.config/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying arkrc To Directory .config" >> ~/install-log.txt; exit 1; }
cp -rf ~/temp/dotfiles/custom/files/baloofileinformationrc "$HOME/.config/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying baloofileinformationrc To Directory .config" >> ~/install-log.txt; exit 1; }
cp -rf ~/temp/dotfiles/custom/files/dolphin.kmessagebox "$HOME/.config/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying dolphin.kmessagebox To Directory .config" >> ~/install-log.txt; exit 1; }
cp -rf ~/temp/dotfiles/custom/files/dolphinrc "$HOME/.config/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying dolphinrc To Directory .config" >> ~/install-log.txt; exit 1; }
cp -rf ~/temp/dotfiles/custom/files/kdeglobals "$HOME/.config/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying kdeglobals To Directory .config" >> ~/install-log.txt; exit 1; }
cp -rf ~/temp/dotfiles/custom/files/kiorc "$HOME/.config/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying kiorc To Directory .config" >> ~/install-log.txt; exit 1; }
cp -rf ~/temp/dotfiles/custom/files/ktrashrc "$HOME/.config/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying ktrashrc To Directory .config" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Dolphin Config Files Copied" >> ~/install-log.txt