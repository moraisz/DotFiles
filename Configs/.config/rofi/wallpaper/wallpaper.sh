#!/bin/bash

WALLPAPERS_DIR="$HOME/Imagens/Wallpapers/"

THEME="$HOME/.config/rofi/wallpaper/style.rasi"

ROFI_CMD="rofi -dmenu -i -show-icons -theme $THEME"

choice=$(\
    ls --escape "$WALLPAPERS_DIR" | \
        while read A; do echo -en "$A\x00icon\x1f$WALLPAPERS_DIR/$A\n"; done | \
        $ROFI_CMD
)

wallpaper="$WALLPAPERS_DIR/$choice"

swww img -t any --transition-bezier 0.0,0.0,1.0,1.0 --transition-duration 1 --transition-step 255 --transition-fps 60 "$wallpaper"
# ln -sf "$wallpaper" "$WALLPAPERS_DIR"/current.wall

# convert "$wallpaper" -resize 1280x720 -background "#1e1e2e" -flatten -blur 0x6 -quality 85 ~/.cache/rofi/wallpaper-rofi.jpg

exit 1
