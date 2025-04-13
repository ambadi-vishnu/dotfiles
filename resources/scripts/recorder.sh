#!/bin/env bash

ICON_PATH="$HOME/.config/swaync/icons"

pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send -a "Screen Recorder" -i $ICON_PATH/recording.png -h string:wf-recorder:record -t 1000 "Finished Recording" && exit 0

notify-send -a "Screen Recorder" -i $ICON_PATH/recording.png -h string:wf-recorder:record -t 1000 "Recording in:" "<span color='#90a4f4' font='26px'><b>3</b></span>"

sleep 1

notify-send -a "Screen Recorder" -i $ICON_PATH/recording.png -h string:wf-recorder:record -t 1000 "Recording in:" "<span color='#90a4f4' font='26px'><b>2</b></span>"

sleep 1

notify-send -a "Screen Recorder" -i $ICON_PATH/recording.png -h string:wf-recorder:record -t 950 "Recording in:" "<span color='#90a4f4' font='26px'><b>1</b></span>"

sleep 1

dateTime=$(date +%d-%m-%Y-%H:%M:%S)
wf-recorder --bframes 0 -f $HOME/screenshots/$dateTime.mp4
