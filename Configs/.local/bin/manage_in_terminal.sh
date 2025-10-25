#!/usr/bin/env bash

source "${HOME}/.local/bin/envs.sh"

open_file_in_editor() {
    exec "$TERMINAL" "$EDITOR" "$1"
}

open_tui_app() {
    exec "$TERMINAL" "$1"
}

open_tui_app_fullscreen() {
    exec "$TERMINAL" --start-as=fullscreen "${@:2}"
    echo ${0:2}
}

$1 ${@:2}
