#!/bin/sh

case $SENDER in
    "mouse.entered")
        sketchybar --animate linear 20 --set "$NAME" label.width=dynamic
    ;;
    "mouse.exited")
        sketchybar --animate linear 20 --set "$NAME" label.width=0
    ;;
    *)
        weather=$($CONFIG_DIR/utils/weather/get_weather.py)
        weather_icon=$($CONFIG_DIR/utils/weather/get_weather_icon.py "$weather")
        sketchybar --set "$NAME" icon="$weather_icon" label="$weather" label.width=0
    ;;
esac
