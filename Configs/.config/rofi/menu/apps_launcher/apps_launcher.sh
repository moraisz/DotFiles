#!/usr/bin/env bash

source ~/.local/bin/envs.sh

ROFI_THEME="$ROFI_APPS_LAUNCHER_DIR/style.rasi"

rofi \
    -show drun \
    -theme $ROFI_THEME
