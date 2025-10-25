#!/usr/bin/env bash

source ~/.local/bin/envs.sh

# Current directory for files
ROFI_THEME="$ROFI_POWERMENU_DIR/style.rasi"
ROFI_CMD="rofi -dmenu -theme $ROFI_THEME"

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
CHOICE="$(printf '%s\n' "${OPTIONS[@]}" | $ROFI_CMD)"

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
