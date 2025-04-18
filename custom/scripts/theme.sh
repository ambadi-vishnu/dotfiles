#!/bin/bash

#.themes Directory Check
if [ ! -d "$HOME/.themes" ]; then
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Creating .themes Directory..." >> ~/install-log.txt
    mkdir -p "$HOME/.themes" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Creating .themes Directory" >> ~/install-log.txt; exit 1; }
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: .themes Directory Created" >> ~/install-log.txt
else
    echo "$(date '+%A %d %B %Y | %I:%M %p'): Message: .themes Directory Already Exist" >> ~/install-log.txt
fi

#Copy New Themes To Themes Directory
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Copying New Themes To Themes Directory..." >> ~/install-log.txt
cp -rf ~/temp/dotfiles/custom/.themes/* "$HOME/.themes/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying New Themes To Themes Directory" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: New Themes Copied To Themes Directory" >> ~/install-log.txt

#Create Symlink For Assets Directory In .config Directory
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Creating Symlink For Assets Directory In .config Directory..." >> ~/install-log.txt
ln -s ~/.themes/Dracula/assets "$HOME/.config/assets" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Creating Symlink For Assets Directory In .config Directory" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Symlink Created For Assets Directory In .config Directory" >> ~/install-log.txt

#Copy gtk-4.0 Directory To .config Directory
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Copying gtk-4.0 Directory To .config Directory..." >> ~/install-log.txt
cp -rf ~/.themes/Dracula/gtk-4.0 "$HOME/.config/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying gtk-4.0 Directory To .config Directory" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: gtk-4.0 Directory Copied To .config Directory" >> ~/install-log.txt

#Copy gtkrc-2.0 To Home Directory
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Copying gtkrc-2.0 To Home Directory..." >> ~/install-log.txt
cp -rf ~/temp/dotfiles/custom/files/.gtkrc-2.0 "$HOME/" || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying gtkrc-2.0 To Home Directory" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: File gtkrc-2.0 Copied To Home Directory" >> ~/install-log.txt