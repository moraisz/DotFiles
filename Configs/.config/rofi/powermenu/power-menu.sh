#!/bin/bash

# Current directory for files
dir="$HOME/.config/rofi/powermenu/"
theme='style'

# Power menu options
options=(
    "  Shutdown"
    "  Reboot"
    "  Lock"
    " Suspend"
    "  Logout"
    " Cancel"
)

# Show Rofi with two columns, no input bar, and large font
choice="$(printf '%s\n' "${options[@]}" | rofi -dmenu \
    -p 'Power Menu' \
    -theme ${dir}/${theme}.rasi
)"

case "$choice" in
    " Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Lock")
        if command -v gtklock >/dev/null; then
            gtklock
        elif command -v hyprlock >/dev/null; then
            hyprlock
        elif command -v i3lock >/dev/null; then
            i3lock
        elif command -v betterlockscreen >/dev/null; then
            betterlockscreen -l
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
            elif command -v swaymsg >/dev/null; then
                swaymsg exit
            fi
        else
            pkill -KILL -u "$USER"
        fi
        ;;
    " Cancel")
        exit 0
        ;;
esac
