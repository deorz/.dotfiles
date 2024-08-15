#!/bin/sh

LAYOUT="$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "KeyboardLayout Name" | cut -c 33- | rev | cut -c 2- | rev)"

case "$LAYOUT" in
    "ABC") SHORT_LAYOUT="EN";;
    "RussianWin") SHORT_LAYOUT="RU";;
esac

sketchybar --set keyboard label="$SHORT_LAYOUT"
