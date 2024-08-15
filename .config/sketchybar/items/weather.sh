#!/bin/sh

sketchybar --add item  weather right                            \
           --set       weather icon.padding_right=8             \
                               script="$PLUGIN_DIR/weather.sh"  \
                               update_freq=900                  \
           --subscribe weather mouse.entered                    \
           --subscribe weather mouse.exited
