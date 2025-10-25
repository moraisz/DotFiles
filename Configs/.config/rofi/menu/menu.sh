#!/usr/bin/env bash

source ~/.local/bin/envs.sh

# Paths
ROFI_THEME="$ROFI_MENU_DIR/style.rasi"
ROFI_CMD="rofi -dmenu -i -theme $ROFI_THEME"

# Menu options
OPTIONS=(
    " Aplicativos"
    " Tema"
    "󰸉 Papel de Parede"
    " Configurações"
    " Sobre"
    "󰤆 Sistema"
)

# Show menu
CHOICE="$(printf '%s\n' "${OPTIONS[@]}" | $ROFI_CMD)"

case "$CHOICE" in
    " Aplicativos") $HOME_CONFIG_DIR/rofi/menu/apps_launcher/apps_launcher.sh ;;
    " Tema") $HOME_CONFIG_DIR/rofi/menu/style/theme_selector/theme_selector.sh ;;
    "󰸉 Papel de Parede") $HOME_CONFIG_DIR/rofi/menu/style/wallpaper_selector/wallpaper_selector.sh ;;
    " Configurações") notify-send "Em desenvolvimento!" ;;
    " Sobre") kitty --start-as=fullscreen --class=ArchLinux -e sh -c 'sleep 0.3; fastfetch; read -n 1 -s' ;;
    "󰤆 Sistema") $HOME_CONFIG_DIR/rofi/menu/powermenu/powermenu.sh ;;
esac
