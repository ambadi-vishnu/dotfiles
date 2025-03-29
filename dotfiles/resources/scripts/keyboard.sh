#!/bin/sh

keyboard=$(brightnessctl -d dell::kbd_backlight | awk '/Current brightness:/ {print $3}')

echo $keyboard > /home/vishnu/resources/temporary/keyboard