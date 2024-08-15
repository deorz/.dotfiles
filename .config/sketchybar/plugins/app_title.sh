function set_app_title() {
    app_title=$(aerospace list-windows --focused --format "%{app-name}")
    if [ "$app_title" = "" ]; then
        sketchybar --set "$NAME" label.drawing=off icon.drawing=off background.drawing=off
        exit 0
    fi
    app_icon=""
    if [ "$app_title" != "" ]; then
        app_icon=$($CONFIG_DIR/plugins/icon_map_fn.sh $app_title)
    fi
    sketchybar --set "$NAME" icon=$app_icon label="$app_title" label.drawing=on icon.drawing=on background.drawing=on
}

case "$EVENT" in
    "FOCUS_CHANGED")
        set_app_title
    ;;
esac

if [ "$SENDER" = "forced" ]; then
    set_app_title
fi
