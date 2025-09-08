#!/bin/bash

# Constants
THEME="$HOME/.config/rofi/powermenu/style.rasi"
ROFI_CMD="rofi -dmenu -i -show-icons -theme $THEME"

# Icon paths
ICON_DIR="$HOME/.config/rofi/powermenu/icons"
declare -A icons=(
    ["Shutdown"]="$ICON_DIR/shutdown.png"
    ["Reboot"]="$ICON_DIR/reboot.png"
    ["Lock"]="$ICON_DIR/lock.png"
    ["Suspend"]="$ICON_DIR/suspend.png"
    ["Logout"]="$ICON_DIR/logout.png"
    ["Cancel"]="$ICON_DIR/cancel.png"
)

# Power menu options
options=(
    "Shutdown"
    "Reboot"
    "Lock"
    "Suspend"
    "Logout"
    "Cancel"
)

# Build options with icons for rofi
menu=()
for opt in "${options[@]}"; do
    menu+=("$(printf '%s\\x00icon\x1f%s' "$opt" "${icons[$opt]}")")
done
menu_str=$(printf '%s\n' "${menu[@]}")

choice="$(echo -e "$menu_str" | $ROFI_CMD)"

case "$choice" in
    "Shutdown")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Lock")
        if command -v hyprlock >/dev/null; then
            hyprlock
        else
            notify-send "No lock utility found."
        fi
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Logout")
        if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
            if command -v hyprctl >/dev/null; then
                hyprctl dispatch exit
            fi
        else
            pkill -KILL -u "$USER"
        fi
        ;;
    "Cancel")
        exit 0
        ;;
esac
