#!/bin/bash

#current battery percentage
battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

#battery status (charging / discharging / not charging)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

#battery icons for each 10% segments
battery_icons=("󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰁹")

#battery charging icon
charging_icon="󰂄"

#plugged in not charging icon
plugged_icon=""

#calculate index for the icon array
icon_index=$((battery_percentage / 10))

#index does not exceed the array length
if [ "$icon_index" -gt 9 ]; then
    icon_index=9
fi

#initialize battery icon
battery_icon=""

#setting battery icon as per status
if [ "$battery_status" = "Charging" ]; then
    battery_icon="$charging_icon"
elif [ "$battery_status" = "Discharging" ]; then
    battery_icon="${battery_icons[icon_index]}"
elif [ "$battery_status" = "Not charging" ]; then
    battery_icon="$plugged_icon"
fi

#output the battery percentage and icon
echo "$battery_percentage% $battery_icon"
