#!/bin/bash

# Path to your icons
ICON_PATH="$HOME/.config/swaync/icons/"

# Function to send notifications
send_notification() {
    local title="$1"
    local message="$2"
    notify-send "$title" "$message"
}

# Function to check battery status
check_battery_status() {
    # Get battery capacity and status
    local capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    local status=$(cat /sys/class/power_supply/BAT0/status)

    # Check for notifications
    if [ "$capacity" -le 20 ] && [ "$previous_status" != "low" ]; then
         notify-send -u critical -i "$ICON_PATH/battery-low.png" -a "Battery Updates" "Battery Level: 20%" "Low Battery. Connect Charger"
        previous_status="low"
    elif [ "$capacity" -eq 100 ] && [ "$previous_status" != "full" ]; then
         notify-send -u normal -i "$ICON_PATH/battery-full.png" -a "Battery Updates" "Battery Level: 100%" "Battery Fully Charged. Unplug Charger"
        previous_status="full"
    fi

    # Check for plugging/unplugging events
    if [ "$status" == "Charging" ] && [ "$previous_power_status" != "plugged" ]; then
        notify-send -u normal -i "$ICON_PATH/battery-charging.png" -a "Battery Updates" "Battery Charging" "Plugged In"
        previous_power_status="plugged"
    elif [ "$status" == "Discharging" ] && [ "$previous_power_status" != "unplugged" ]; then
        notify-send -u normal -i "$ICON_PATH/battery-unplugged.png" -a "Battery Updates" "Battery Discharging" "Charger Unplugged"
        previous_power_status="unplugged"
    fi
}

# Initialize previous states
previous_status=""
previous_power_status=""

# Run the check in an infinite loop
while true; do
    check_battery_status
    sleep 60  # Check every minute
done
