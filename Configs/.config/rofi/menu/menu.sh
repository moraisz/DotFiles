#!/bin/bash

# Paths
ROFI_THEME="$HOME/.config/rofi/menu/style.rasi"
ROFI_CMD="rofi -dmenu -i -theme $ROFI_THEME"

# Menu options
OPTIONS=(
    " Aplicativos"
    " Tema"
    "󰸉 Wallpaper"
    " Configurações"
    " Sobre"
    "󰤆 Sistema"
)

# Show menu
CHOICE="$(printf '%s\n' "${OPTIONS[@]}" | rofi -dmenu \
    -p 'Menu' \
    -theme ${ROFI_THEME}
)"

case "$CHOICE" in
    " Aplicativos") ~/DotFiles/Configs/.config/rofi/menu/apps_launcher/apps_launcher.sh ;;
    " Tema") ~/DotFiles/Configs/.config/rofi/menu/style/theme_selector/theme_selector.sh ;;
    "󰸉 Wallpaper") ~/DotFiles/Configs/.config/rofi/menu/style/wallpaper_selector/wallpaper_selector.sh ;;
    " Configurações") notify-send "Em desenvolvimento!" ;;
    " Sobre") kitty --start-as=fullscreen --class=ArchLinux -e sh -c 'sleep 0.3; fastfetch; read -n 1 -s' ;;
    "󰤆 Sistema") ~/DotFiles/Configs/.config/rofi/menu/powermenu/powermenu.sh ;;
esac
