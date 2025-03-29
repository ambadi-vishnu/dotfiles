#!/bin/bash

#Installing Fingerprint Utilities
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Fingerprint Utilities..." >> ~/install-log.txt
sudo pacman -S --needed --noconfirm fprintd || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package fprintd" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm libfprint || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package libfprint" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Fingerprint Utilities Installed" >> ~/install-log.txt

#Starting Fingerprint Service
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Starting Fingerprint Service..." >> ~/install-log.txt
sudo systemctl enable --now fprintd || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Starting fprintd Service" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Started Fingerprint Service" >> ~/install-log.txt

#Enroll Fingerprint
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Enrolling Fingerprint..." >> ~/install-log.txt
sudo fprintd-enroll vishnu || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Enrolling Fingerprint" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Fingerprint Enrolled" >> ~/install-log.txt

#Verify Fingerprint
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Verifying Fingerprint..." >> ~/install-log.txt
fprintd-verify vishnu || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Fingerprint Verification Failed" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Fingerprint Verified" >> ~/install-log.txt

#Remove Existing SDDM PAM Configuration
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Removing Existing SDDM PAM Configuration..." >> ~/install-log.txt
sudo rm -rf /etc/pam.d/sddm || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Removing Existing SDDM PAM Configuration" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Removed Existing SDDM PAM Configuration" >> ~/install-log.txt

#Copy Custom SDDM PAM Configuration
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Copying Custom SDDM PAM Configuration..." >> ~/install-log.txt
sudo cp -rf ~/temp/dotfiles/custom/files/sddm /etc/pam.d/ || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Copying Custom SDDM PAM Configuration" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Copied Custom SDDM PAM Configuration" >> ~/install-log.txt