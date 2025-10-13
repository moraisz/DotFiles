#!/bin/bash

# Current directory for files
ROFI_THEME="$HOME/DotFiles/Configs/.config/rofi/menu/powermenu/style.rasi"

# Power menu options
OPTIONS=(
    " Cancel"
    " Shutdown"
    " Reboot"
    " Lock"
    " Suspend"
    " Logout"
)

# Show Rofi with two columns, no input bar, and large font
CHOICE="$(printf '%s\n' "${OPTIONS[@]}" | rofi -dmenu \
    -p 'Power Menu' \
    -theme ${ROFI_THEME}
)"

case "$CHOICE" in
    " Cancel")
        exit 0
        ;;
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
esac
