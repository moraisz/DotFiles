#!/usr/bin/env bash

install_via_pacman() {
    sudo pacman -Syu --noconfirm "$1"
}

install_via_aur() {
    yay -S --noconfirm "$1"
}
