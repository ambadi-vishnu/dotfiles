#!/bin/bash

WEATHER_PATH=$HOME/resources/scripts/weather.py

$WEATHER_PATH --output-format='{{city}} | {{current.icon}} {{current.description_long | title}} {{current.temperature}}°C' > ~/resources/temporary/weatherinfo.txt

cat ~/resources/temporary/weatherinfo.txt