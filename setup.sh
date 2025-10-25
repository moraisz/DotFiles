#!/usr/bin/env bash

source $HOME/DotFiles/Configs/.local/bin/envs.sh

link() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        read -rp "O destino '$dest' já existe. Deseja substituir? [s/N]: " confirm
        [[ "$confirm" =~ ^[sS]$ ]] || {
            echo "❌ Link cancelado."
            return 1
        }
        rm -rf "$dest"
    fi

    ln -s "$src" "$dest"
    echo "Link criado: $src -> $dest"
}

copy() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        read -rp "O destino '$dest' já existe. Deseja substituir? [s/N]: " confirm
        [[ "$confirm" =~ ^[sS]$ ]] || {
            echo "❌ Copia cancelada."
            return 1
        }
        rm -rf "$dest"
    fi

    cp -r "$src" "$dest"
    echo "Copiado: $src -> $dest"
}

echo
echo "🛠️  Como deseja instalar os arquivos?"
echo "1) 🔗 Linkar (recomendado para updates automáticos)"
echo "2) 📋 Copiar (mais independente)"
echo "3) ❌ Cancelar"
echo

read -rp "Escolha [1/2/3]: " option
echo

case "$option" in
    1)
        echo "🔗 Linkando arquivos..."
        action="link"
        ;;
    2)
        echo "📋 Copiando arquivos..."
        action="copy"
        ;;
    3)
        echo "❌ Cancelando."
        exit 0
        ;;
    *)
        echo "❌ Opção inválida. Abortando."
        exit 1
        ;;
esac

echo

$action $DOTFILES/Configs/.zshrc ~/.zshrc
$action $DOTFILES/Configs/.tmux.conf ~/.tmux.conf

$action $DOTFILES_CONFIG_DIR/btop/ $HOME_CONFIG_DIR/btop
$action $DOTFILES_CONFIG_DIR/fastfetch/ $HOME_CONFIG_DIR/fastfetch
$action $DOTFILES_CONFIG_DIR/hypr/ $HOME_CONFIG_DIR/hypr
$action $DOTFILES_CONFIG_DIR/kitty/ $HOME_CONFIG_DIR/kitty
$action $DOTFILES_CONFIG_DIR/mako/ $HOME_CONFIG_DIR/mako
$action $DOTFILES_CONFIG_DIR/nvim/ $HOME_CONFIG_DIR/nvim
$action $DOTFILES_CONFIG_DIR/rofi/ $HOME_CONFIG_DIR/rofi
$action $DOTFILES_CONFIG_DIR/waybar/ $HOME_CONFIG_DIR/waybar

$action $DOTFILES_BIN_DIR/ $HOME_BIN

$action $DOTFILES_THEMES_DIR/ $HOME_THEMES
$action $DOTFILES_WALLPAPERS_DIR/ $HOME_WALLPAPERS

echo "Concluido!"
