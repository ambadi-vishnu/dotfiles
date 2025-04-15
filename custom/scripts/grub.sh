#!/bin/bash

#Configure GRUB Theme
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Configuring GRUB Theme..." >> ~/install-log.txt
sudo pacman -S --needed --noconfirm os-prober || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package os-prober" >> ~/install-log.txt; exit 1; }
sudo cp -rf ~/temp/dotfiles/sekiro /usr/share/grub/themes || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying GRUB Theme" >> ~/install-log.txt; exit 1; }
sudo sed -i "/^GRUB_THEME=/c\GRUB_THEME=\"/usr/share/grub/themes/sekiro/theme.txt\"
/^#GRUB_THEME=/c\GRUB_THEME=\"/usr/share/grub/themes/sekiro/theme.txt\"" /etc/default/grub || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Adding Theme Details To GRUB Config" >> ~/install-log.txt; exit 1; }
sudo grub-mkconfig -o /boot/grub/grub.cfg || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Generating GRUB Config" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: GRUB Theme Configured" >> ~/install-log.txt