#!/usr/bin/env bash

ROFI_THEME="$HOME/DotFiles/Configs/.config/rofi/menu/apps_launcher/style.rasi"

rofi \
    -show drun \
    -theme $ROFI_THEME
