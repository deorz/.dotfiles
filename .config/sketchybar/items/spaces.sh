#!/usr/bin/env sh

sketchybar --add event aerospace_event

for sid in $(aerospace list-workspaces --all); do

    space_params=(
        associated_space=1
        icon="$sid"
        icon.padding_left=22
        icon.padding_right=22
        label.padding_right=22
        icon.highlight_color=$GREEN
        label.font="sketchybar-app-font:Regular:16.0"
        script="$PLUGIN_DIR/space.sh $sid"
        click_script="$PLUGIN_DIR/change_space.sh $sid"
    )

  sketchybar --add space space.$sid left                              \
             --set space.$sid "${space_params[@]}"                    \
             --subscribe space.$sid aerospace_event                   \
             --subscribe space.$sid space_windows_change
 done

