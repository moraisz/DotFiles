#!/bin/bash

DOTFILES=~/DotFiles

echo "Criando links simbolicos dos dotfiles..."

ln -sf $DOTFILES/Configs/.zshrc ~/.zshrc
ln -sf $DOTFILES/Configs/.tmux.conf ~/.tmux.conf

ln -sf $DOTFILES/Configs/.config/hypr ~/.config/hypr
ln -sf $DOTFILES/Configs/.config/waybar/ ~/.config/waybar
ln -sf $DOTFILES/Configs/.config/rofi/ ~/.config/rofi
ln -sf $DOTFILES/Configs/.config/kitty/ ~/.config/kitty
ln -sf $DOTFILES/Configs/.config/mako/ ~/.config/mako
ln -sf $DOTFILES/Configs/.config/fastfetch/ ~/.config/fastfetch
ln -sf $DOTFILES/Configs/.config/btop/ ~/.config/btop

ln -sf $DOTFILES/Wallpapers/ ~/Imagens/Wallpapers

echo "Concluido!"
