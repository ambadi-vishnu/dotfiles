#!/bin/bash

WEATHER_PATH=$HOME/resources/scripts/weather.py


$WEATHER_PATH --output-format '{"text": "{{city}}: {{current.icon}} {{current.temperature}}°C", "alt": "{{city}}: {{current.temperature_min}}°C -> {{current.temperature_max}}°C", "tooltip": "{{city}}: {{current.temperature}}°C, {{current.description_long | title}} -> {{next.temperature}}°C, {{next.description_long | title}}"}'