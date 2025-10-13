#!/bin/bash

ROFI_THEME="~/DotFiles/Configs/.config/rofi/menu/style/wallpaper_selector/style.rasi"
ROFI_CMD="rofi -dmenu -i -show-icons -theme $ROFI_THEME"
WALLPAPERS_DIR="$HOME/Imagens/Wallpapers/"

CHOICE=$(\
    ls --escape "$WALLPAPERS_DIR" | \
        while read A; do echo -en "$A\x00icon\x1f$WALLPAPERS_DIR/$A\n"; done | \
        $ROFI_CMD
)

WALLPAPER="$WALLPAPERS_DIR/$CHOICE"

swww img -t any --transition-bezier 0.0,0.0,1.0,1.0 --transition-duration 1 --transition-step 255 --transition-fps 60 "$WALLPAPER"

exit 1
