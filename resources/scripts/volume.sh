#!/bin/bash

#  ▗▖  ▗▖ ▗▄▖ ▗▖   ▗▖ ▗▖▗▖  ▗▖▗▄▄▄▖     ▗▄▄▖ ▗▄▖ ▗▖  ▗▖▗▄▄▄▖▗▄▄▖  ▗▄▖ ▗▖   
#  ▐▌  ▐▌▐▌ ▐▌▐▌   ▐▌ ▐▌▐▛▚▞▜▌▐▌       ▐▌   ▐▌ ▐▌▐▛▚▖▐▌  █  ▐▌ ▐▌▐▌ ▐▌▐▌   
#  ▐▌  ▐▌▐▌ ▐▌▐▌   ▐▌ ▐▌▐▌  ▐▌▐▛▀▀▘    ▐▌   ▐▌ ▐▌▐▌ ▝▜▌  █  ▐▛▀▚▖▐▌ ▐▌▐▌   
#   ▝▚▞▘ ▝▚▄▞▘▐▙▄▄▖▝▚▄▞▘▐▌  ▐▌▐▙▄▄▖    ▝▚▄▄▖▝▚▄▞▘▐▌  ▐▌  █  ▐▌ ▐▌▝▚▄▞▘▐▙▄▄▖

# Current Volume Level
current_volume() {
    volume=$(pamixer --get-volume)
    if [[ "$volume" -eq "0" ]]; then
        echo "Muted"
    else
        echo "$volume%"
    fi
}

# Increase Volume
increase_volume() {
    if [ "$(pamixer --get-mute)" == "true" ]; then
        toggle_audio_mute
    else
        pamixer -i 5 --allow-boost --set-limit 150
    fi
}

# Decrease Volume
decrease_volume() {
    if [ "$(pamixer --get-mute)" == "true" ]; then
        toggle_audio_mute
    else
        pamixer -d 5
    fi
}

# Toggle Audio Mute
toggle_audio_mute() {
    if [ "$(pamixer --get-mute)" == "false" ]; then
        pamixer -m
    elif [ "$(pamixer --get-mute)" == "true" ]; then
        pamixer -u
    fi
}

# Toggle Microphone Mute
toggle_microphone_mute() {
    if [ "$(pamixer --default-source --get-mute)" == "false" ]; then
        pamixer --default-source -m
    elif [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        pamixer --default-source -u
    fi
}

# Current Microphone Volume Level
current_microphone_volume() {
    volume=$(pamixer --default-source --get-volume)
    if [[ "$volume" -eq "0" ]]; then
        echo "Muted"
    else
        echo "$volume%"
    fi
}

# Increase Microphone Volume
increase_microphone_volume() {
    if [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        toggle_microphone_mute
    else
        pamixer --default-source -i 5
    fi
}

# Decrease Microphone Volume
decrease_microphone_volume() {
    if [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        toggle_microphone_mute
    else
        pamixer --default-source -d 5
    fi
}

# Main Execution Block
case "$1" in
    --get)
        current_volume
        ;;
    --inc)
        increase_volume
        ;;
    --dec)
        decrease_volume
        ;;
    --toggle)
        toggle_audio_mute
        ;;
    --toggle-mic)
        toggle_microphone_mute
        ;;
    --mic-inc)
        increase_microphone_volume
        ;;
    --mic-dec)
        decrease_microphone_volume
        ;;
    *)
        current_volume
        ;;
esac