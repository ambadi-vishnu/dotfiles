#!/bin/bash

# Importing Spotify GPG Key
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Importing Spotify GPG Key..." >> ~/install-log.txt
cd ~/.cache/ && curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | gpg --import - || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Importing Spotify GPG Key" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Imported Spotify GPG Key" >> ~/install-log.txt

# Installing Development Tools
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Development Tools..." >> ~/install-log.txt
sudo pacman -S --needed --noconfirm devtools || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package devtools" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Installed Development Tools" >> ~/install-log.txt

# Cloning and Building Spotify AUR Package
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Cloning & Building Spotify AUR Package..." >> ~/install-log.txt
git clone https://aur.archlinux.org/spotify.git || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Cloning Spotify AUR Package" >> ~/install-log.txt; exit 1; }
cd spotify && pkgctl build || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Building Spotify Package" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Built Spotify AUR Package" >> ~/install-log.txt

# Installing Spotify Package
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Spotify Package..." >> ~/install-log.txt
sudo pacman -U --needed --noconfirm spotify-1:1.2.60.564-2-x86_64.pkg.tar.zst || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Spotify Package" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Installed Spotify Package" >> ~/install-log.txt

# Installing zip and unzip
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing zip and unzip..." >> ~/install-log.txt
sudo pacman -S --needed --noconfirm zip unzip || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing zip and unzip" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Installed zip and unzip" >> ~/install-log.txt

# Running SpotX Script
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Running SpotX Script..." >> ~/install-log.txt
bash <(curl -sSL https://spotx-official.github.io/run.sh) || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Running SpotX Script" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Ran SpotX Script" >> ~/install-log.txt

# Installing Spicetify CLI
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Spicetify CLI..." >> ~/install-log.txt
yay -S spicetify-cli || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing spicetify-cli" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Installed Spicetify CLI" >> ~/install-log.txt

# Applying Spicetify Backup
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Applying Spicetify Backup..." >> ~/install-log.txt
spicetify backup apply || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Applying Spicetify Backup" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Applied Spicetify Backup" >> ~/install-log.txt

# Installing Spicetify Lucid Theme
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Spicetify Lucid Theme..." >> ~/install-log.txt
curl -fsSL https://raw.githubusercontent.com/sanoojes/Spicetify-Lucid/main/install/install.sh | sh || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Spicetify Lucid Theme" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Installed Spicetify Lucid Theme" >> ~/install-log.txt