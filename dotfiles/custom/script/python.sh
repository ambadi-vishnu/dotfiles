#!/bin/bash

#Install Python & Necessary Libraries

echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Python & Necessary Libraries..." >> ~/install-log.txt
sudo pacman -S --needed --noconfirm python || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-autocommand || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-autocommand" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-charset-normalizer || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-charset-normalizer" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-dbus || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-dbus" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-gobject || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-gobject" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-idna || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-idna" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-jaraco.collections || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-jaraco.collections" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-jaraco.context || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-jaraco.context" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-jaraco.functools || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-jaraco.functools" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-jaraco.text || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-jaraco.text" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-jinja || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-jinja" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-markupsafe || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-markupsafe" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-more-itertools || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-more-itertools" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-packaging || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-packaging" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-platformdirs || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-platformdirs" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-requests || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-requests" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-setproctitle || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-setproctitle" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-setuptools || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-setuptools" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-tqdm || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-tqdm" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-unidecode || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-unidecode" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-urllib3 || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-urllib3" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm python-wheel || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package python-wheel" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Installed Python & Necessary Libraries..." >> ~/install-log.txt