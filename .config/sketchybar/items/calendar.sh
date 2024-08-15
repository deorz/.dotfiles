#!/usr/bin/env sh

sketchybar --add item     calendar right                    \
           --set calendar icon=􀉉                            \
                          icon.padding_left=8               \
                          label.padding_right=8             \
                          label.width=50                    \
                          label.align=right                 \
                          background.color=$BACKGROUND_1    \
                          update_freq=30                    \
                          script="$PLUGIN_DIR/calendar.sh"
