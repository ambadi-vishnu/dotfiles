#!/bin/bash

#Adding Console Font
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Adding Console Font..." >> ~/install-log.txt
sudo sh -c 'echo "FONT=lat9w-16" >> /etc/vconsole.conf' || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Adding Console Font" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Console Font Added" >> ~/install-log.txt

#Install mkinitcpio-firmware
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Package mkinitcpio-firmware..." >> ~/install-log.txt
yay -S mkinitcpio-firmware --noconfirm || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package mkinitcpio-firmware" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Package mkinitcpio-firmware Installed" >> ~/install-log.txt