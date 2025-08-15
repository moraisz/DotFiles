#!/bin/bash

DOTFILES=~/DotFiles

echo "Criando links simbolicos dos dotfiles..."

link() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        local backup="${dest}_bkp"

        # Garante que não sobrescreve um backup antigo
        if [ -e "$backup" ] || [ -L "$backup" ]; then
            echo "Backup já existe: $backup — renomeando com timestamp"
            backup="${backup}_$(date +%Y%m%d%H%M%S)"
        fi

        echo "Movendo destino existente para: $backup"
        mv "$dest" "$backup"
    fi

    ln -s "$src" "$dest"
    echo "Link criado: $dest -> $src"
}

link $DOTFILES/Configs/.zshrc ~/.zshrc
link $DOTFILES/Configs/.tmux.conf ~/.tmux.conf

link $DOTFILES/Configs/.config/btop/ ~/.config/btop
link $DOTFILES/Configs/.config/fastfetch/ ~/.config/fastfetch
link $DOTFILES/Configs/.config/gtk-3.0/ ~/.config/gtk-3.0
link $DOTFILES/Configs/.config/gtk-4.0/ ~/.config/gtk-4.0
link $DOTFILES/Configs/.config/hypr ~/.config/hypr
link $DOTFILES/Configs/.config/kitty/ ~/.config/kitty
link $DOTFILES/Configs/.config/mako/ ~/.config/mako
link $DOTFILES/Configs/.config/nvim/ ~/.config/nvim
link $DOTFILES/Configs/.config/rofi/ ~/.config/rofi
link $DOTFILES/Configs/.config/waybar/ ~/.config/waybar

link $DOTFILES/Wallpapers/ ~/Imagens/Wallpapers

echo "Concluido!"
