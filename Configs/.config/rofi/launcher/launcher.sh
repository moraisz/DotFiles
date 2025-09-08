#!/bin/bash

dir="$HOME/.config/rofi/launcher"
theme='style.rasi'

rofi \
    -show drun \
    -theme ${dir}/${theme}
