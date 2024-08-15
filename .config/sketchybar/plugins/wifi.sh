#!/bin/sh

case "$SENDER" in
    "mouse.entered")
            sketchybar --animate tanh 20 --set "$NAME" label.width=dynamic
        ;;
    "mouse.exited")
            sketchybar --animate tanh 20 --set "$NAME" label.width=0
        ;;
    *)
        IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
        IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

        if [[ $IS_VPN != "" ]]; then
            COLOR=$CYAN
            ICON=􁅏
            LABEL="VPN"
        elif [[ $IP_ADDRESS != "" ]]; then
            COLOR=$BLUE
            ICON=􀙇
            LABEL=$IP_ADDRESS
        else
            COLOR=$WHITE
            ICON=􀙥
            LABEL="Not Connected"
        fi

        sketchybar --set $NAME background.color=$COLOR  \
                               icon=$ICON               \
                               label="$LABEL"           \
                               label.width=0
    ;;
esac
