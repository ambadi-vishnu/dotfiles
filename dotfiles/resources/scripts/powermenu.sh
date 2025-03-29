#!/bin/bash

theme="$HOME/.config/rofi/powermenu.rasi"

lock=" Lock"
logout="󰍃 Logout"
poweroff="⏻ Shutdown"
reboot=" Reboot"
sleep=" Sleep"
 
selected_option=$(echo "$lock
$sleep
$logout
$reboot
$poweroff" | rofi -dmenu -i -p "Power Options:" \
		-theme ${theme})

if [ "$selected_option" == "$lock" ];
then
  hyprlock
elif [ "$selected_option" == "$logout" ];
then
 hyprctl dispatch exit
elif [ "$selected_option" == "$poweroff" ];
then
  systemctl poweroff
elif [ "$selected_option" == "$reboot" ];
then
  systemctl reboot
elif [ "$selected_option" == "$sleep" ];
then
  hyprlock & sleep 2 && systemctl suspend
else
  echo "No Match"
fi
