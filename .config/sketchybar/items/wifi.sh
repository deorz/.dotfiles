#!/bin/sh

sketchybar --add item  wifi right                         \
           --set       wifi script="$PLUGIN_DIR/wifi.sh"  \
                            update_freq=30                \
           --subscribe wifi wifi_change                   \
           --subscribe wifi mouse.entered                 \
           --subscribe wifi mouse.exited
