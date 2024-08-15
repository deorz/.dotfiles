#!/bin/sh
sketchybar --add item  app_title center                                         \
           --set       app_title background.color=$BACKGROUND_1                 \
                                 label.font="$FONT:Bold:14.0"                   \
                                 icon.font="sketchybar-app-font:Regular:14.0"   \
                                 label.padding_right=22                         \
                                 icon.padding_left=22                           \
                                 script="$PLUGIN_DIR/app_title.sh"              \
           --subscribe app_title aerospace_event
