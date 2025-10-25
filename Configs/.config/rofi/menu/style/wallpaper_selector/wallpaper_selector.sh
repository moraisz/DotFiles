#!/usr/bin/env bash

source ~/.local/bin/envs.sh

ROFI_THEME="$ROFI_WALLPAPER_SELECTOR_DIR/style.rasi"
ROFI_CMD="rofi -dmenu -i -show-icons -theme $ROFI_THEME"

CHOICE=$(\
    ls --escape "$HOME_WALLPAPERS_DIR" | \
        while read A; do echo -en "$A\x00icon\x1f$HOME_WALLPAPERS_DIR/$A\n"; done | \
        $ROFI_CMD
)

WALLPAPER="$HOME_WALLPAPERS_DIR/$CHOICE"

# swww img -t any --transition-bezier 0.0,0.0,1.0,1.0 --transition-duration 1 --transition-step 255 --transition-fps 60 "$WALLPAPER"
swww img -t any --transition-duration 1 --transition-step 255 --transition-fps 60 "$WALLPAPER"

exit 1
