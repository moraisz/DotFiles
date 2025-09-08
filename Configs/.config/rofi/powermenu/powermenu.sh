#!/bin/bash

# Current directory for files
theme="$HOME/.config/rofi/powermenu/style.rasi"

# Power menu options
options=(
    " Shutdown"
    " Reboot"
    " Lock"
    " Suspend"
    " Logout"
    " Cancel"
)

# Show Rofi with two columns, no input bar, and large font
choice="$(printf '%s\n' "${options[@]}" | rofi -dmenu \
    -p 'Power Menu' \
    -theme ${theme}
)"

case "$choice" in
    " Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Lock")
        if command -v hyprlock >/dev/null; then
            hyprlock
        else
            notify-send "No lock utility found."
        fi
        ;;
    " Suspend")
        systemctl suspend
        ;;
    " Logout")
        if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
            if command -v hyprctl >/dev/null; then
                hyprctl dispatch exit
            fi
        else
            pkill -KILL -u "$USER"
        fi
        ;;
    " Cancel")
        exit 0
        ;;
esac
