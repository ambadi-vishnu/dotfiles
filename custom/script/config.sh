#!/bin/bash

echo "$(date '+%A %d %B %Y | %I:%M %p'): Message: Copying Configuration Files" >> ~/install-log.txt

#.config Directory Check
if [ ! -d "$HOME/.config" ]; then
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Creating .config Directory..." >> ~/install-log.txt
    mkdir -p "$HOME/.config" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Creating Directory .config" >> ~/install-log.txt; exit 1; }
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Created Directory .config" >> ~/install-log.txt
else
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Message: .config Directory Already Exist" >> ~/install-log.txt
fi

#Copy Configuration Files To .config Directory
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Copying Configuration Files To .config Directory..." >> ~/install-log.txt
cp -rf ~/temp/dotfiles/.config/* "$HOME/.config/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying Configuration Files To .config Directory" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Configuration Files Copied To .config Directory" >> ~/install-log.txt

#Copy Resources Folder To Home Directory
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Copying Resources Folder To Home Directory..." >> ~/install-log.txt
cp -rf ~/temp/dotfiles/resources "$HOME/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying Resources Folder To Home Directory" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Resources Folder Copied To Home Directory" >> ~/install-log.txt

#Script Permission Update
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Updating Script Permissions..." >> ~/install-log.txt
chmod +x ~/resources/scripts/* || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Updating Script Permissions" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Script Permissions Updated" >> ~/install-log.txt

#Copy ZSH Essentials To Home Directory
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Copying Zsh Essentials To Home Directory..." >> ~/install-log.txt
cp -rf ~/temp/dotfiles/zsh/.zshrc "$HOME/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying .zshrc To Home Directory" >> ~/install-log.txt; exit 1; }
cp -rf ~/temp/dotfiles/zsh/.zsh "$HOME/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying .zsh To Home Directory" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: ZSH Essentials Copied To Home Directory" >> ~/install-log.txt

#Fonts Directory Check
if [ ! -d "$HOME/.local/share/fonts" ]; then
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Creating Fonts Directory..." >> ~/install-log.txt
    mkdir -p "$HOME/.local/share/fonts" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Creating Fonts Directory" >> ~/install-log.txt; exit 1; }
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Fonts Directory Created" >> ~/install-log.txt
else
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Message: Fonts Directory Already Exist" >> ~/install-log.txt
fi

#Copy New Fonts To Fonts Directory
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Copying New Fonts To Fonts Directory..." >> ~/install-log.txt
cp -rf ~/temp/dotfiles/fonts/* "$HOME/.local/share/fonts/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying New Fonts To Fonts Directory" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: New Fonts Copied To Fonts Directory" >> ~/install-log.txt
