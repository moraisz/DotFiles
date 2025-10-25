#!/usr/bin/env bash

source ~/.local/bin/envs.sh

# Caminhos
ROFI_THEME="$ROFI_THEME_SELECTOR_DIR/style.rasi"
ROFI_CMD="rofi -dmenu -i -p 'Select Theme:' -theme $ROFI_THEME"

# Lista de temas disponíveis (pega apenas diretórios)
THEMES=$(ls -1 "$HOME_THEMES_DIR")

# Mostra lista no rofi
CHOSEN_THEME=$(echo "$THEMES" | $ROFI_CMD)

# Se cancelar, sair
[ -z "$CHOSEN_THEME" ] && exit

# Caminho completo do tema selecionado
THEME_PATH="$HOME_THEMES_DIR/$CHOSEN_THEME"

# Verifica se o tema existe
if [ ! -d "$THEME_PATH" ]; then
    notify-send "❌ Tema não encontrado" "$CHOSEN_THEME"
    exit 1
fi

cp -rf "$THEME_PATH/btop/themes/style.theme" $HOME_CONFIG_DIR/btop/themes/style.theme
cp -rf "$THEME_PATH/hypr/hyprlandFiles/colors.conf" $HOME_CONFIG_DIR/hypr/hyprlandFiles/colors.conf
cp -rf "$THEME_PATH/kitty/theme.conf" $HOME_CONFIG_DIR/kitty/theme.conf
cp -rf "$THEME_PATH/mako/config" $HOME_CONFIG_DIR/mako/config
cp -rf "$THEME_PATH/nvim/lua/config/colorscheme.lua" $HOME_CONFIG_DIR/nvim/lua/config/colorscheme.lua
cp -rf "$THEME_PATH/rofi/colors.rasi" $HOME_CONFIG_DIR/rofi/colors.rasi
cp -rf "$THEME_PATH/waybar/colors.css" $HOME_CONFIG_DIR/waybar

hyprctl reload
makoctl reload
pkill waybar && waybar & disown

# Notificação
notify-send "🎨 Tema aplicado" "$CHOSEN_THEME"
