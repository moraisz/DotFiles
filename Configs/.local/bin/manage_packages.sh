#!/usr/bin/env bash

install_via_pacman() {
    sudo pacman --noconfirm -S "$1"
}

install_via_aur() {
    yay --noconfirm -S "$1"
}

uninstall_via_pacman() {
    sudo pacman --noconfirm -Rns "$1"
}

uninstall_via_aur() {
    yay --noconfirm -Rns "$1"
}

$1 $2
