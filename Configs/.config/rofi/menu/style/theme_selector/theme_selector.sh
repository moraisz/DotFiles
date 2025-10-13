#!/bin/bash

# Caminhos
ROFI_THEME="~/DotFiles/Configs/.config/rofi/menu/style/theme_selector/style.rasi"
ROFI_CMD="rofi -dmenu -i -p 'Select Theme:' -theme $ROFI_THEME"
THEMES_DIR="$HOME/DotFiles/Themes"

# Lista de temas disponíveis (pega apenas diretórios)
THEMES=$(ls -1 "$THEMES_DIR")

# Mostra lista no rofi
CHOSEN_THEME=$(echo "$THEMES" | $ROFI_CMD)

# Se cancelar, sair
[ -z "$CHOSEN_THEME" ] && exit

# Caminho completo do tema selecionado
THEME_PATH="$THEMES_DIR/$CHOSEN_THEME"

# Verifica se o tema existe
if [ ! -d "$THEME_PATH" ]; then
    notify-send "❌ Tema não encontrado" "$CHOSEN_THEME"
    exit 1
fi

cp -rf "$THEME_PATH/btop/themes/style.theme" ~/DotFiles/Configs/.config/btop/themes/style.theme
cp -rf "$THEME_PATH/hypr/hyprlandFiles/colors.conf" ~/DotFiles/Configs/.config/hypr/hyprlandFiles/colors.conf
cp -rf "$THEME_PATH/kitty/theme.conf" ~/DotFiles/Configs/.config/kitty/theme.conf
cp -rf "$THEME_PATH/mako/config" ~/DotFiles/Configs/.config/mako/config
cp -rf "$THEME_PATH/nvim/lua/config/colorscheme.lua" ~/DotFiles/Configs/.config/nvim/lua/config/colorscheme.lua
cp -rf "$THEME_PATH/rofi/colors.rasi" ~/DotFiles/Configs/.config/rofi/colors.rasi
cp -rf "$THEME_PATH/waybar/colors.css" ~/DotFiles/Configs/.config/waybar

hyprctl reload
makoctl reload
pkill waybar && waybar & disown

# Notificação
notify-send "🎨 Tema aplicado" "$CHOSEN_THEME"
