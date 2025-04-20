#!/bin/bash

echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Syncing Package Database - Pacman..." >> ~/install-log.txt
sudo pacman -Syy || echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Syncing Package Database" >> ~/install-log.txt
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Finished Syncing Package Database - Pacman" >> ~/install-log.txt

#Installing Necessary Apps - Pacman
echo "$(date '+%A %d %B %Y | %I:%M %p'): Action: Installing Necessary Applications - Pacman..." >> ~/install-log.txt
sudo pacman -S --needed --noconfirm polkit-gnome || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package polkit-gnome" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm kitty || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package kitty" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm kitty-shell-integration || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package kitty-shell-integration" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm kitty-terminfo || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package kitty-terminfo" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm cliphist || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package cliphist" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm wl-clipboard || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package wl-clipboard" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm wtype || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package wtype" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm rofi-emoji || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package rofi-emoji" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm zsh || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package zsh" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm fzf || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package fzf" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm rofi-wayland || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package rofi-wayland" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm swaync || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package swaync" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm loupe || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package loupe" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm fastfetch || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package fastfetch" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm bluez || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package bluez" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm nwg-look || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package nwg-look" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm kvantum || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package kvantum" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm pamixer || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package pamixer" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm pavucontrol || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package pavucontrol" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm qt5-wayland || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package qt5-wayland" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm qt6-wayland || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package qt6-wayland" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm qt5ct || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package qt5ct" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm kvantum-qt5 || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package kvantum-qt5" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm tela-circle-icon-theme-dracula || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package tela-circle-icon-theme-dracula" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm udiskie || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package udiskie" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm jq || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package jq" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm wf-recorder || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package wf-recorder" >> ~/install-log.txt; exit 1; }
sudo pacman -S --needed --noconfirm power-profiles-daemon || { echo "$(date '+%A %d %B %Y | %I:%M %p'): Error: Failed Installing Package power-profiles-daemon" >> ~/install-log.txt; exit 1; }
echo "$(date '+%A %d %B %Y | %I:%M %p'): Success: Necessary Applications Installed - Pacman" >> ~/install-log.txt
