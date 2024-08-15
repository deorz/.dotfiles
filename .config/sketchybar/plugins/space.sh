#!/usr/bin/env sh

get_app_icons_for_workspace() {
    local apps=$(aerospace list-windows --workspace $1 --format "%{app-name}")
    app_icons=""
    label_drawing=false

    if [ "$apps" != "" ]; then
        while IFS= read -r line; do
            app_icons+="$($CONFIG_DIR/plugins/icon_map_fn.sh $line) "
            label_drawing=true
        done <<< "$apps"
    fi
}

case $EVENT in
    "WORKSPACE_CHANGE")
        if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
            sketchybar --animate tanh 20 --set $NAME icon.highlight=true label.max_chars=100
        else
            sketchybar --animate tanh 20 --set $NAME icon.highlight=false label.max_chars=50
        fi
    ;;
    "WINDOW_MOVED")
        OLD_WORKSPACE=$(aerospace list-workspaces --focused)

        get_app_icons_for_workspace $NEW_WORKSPACE
        sketchybar --set space.$NEW_WORKSPACE label="$app_icons" label.drawing=$label_drawing

        get_app_icons_for_workspace $OLD_WORKSPACE
        sketchybar --set space.$OLD_WORKSPACE label="$app_icons" label.drawing=$label_drawing
    ;;
    *)
        current_workspace=$(aerospace list-workspaces --focused)
        highlight=false
        if [ "$1" = "$current_workspace" ]; then
            highlight=true
        fi

        get_app_icons_for_workspace $1

        sketchybar --animate tanh 20                                        \
                   --set $NAME label="$app_icons"                           \
                               icon.highlight=$highlight                    \
                               label.max_chars=100
    ;;
esac

