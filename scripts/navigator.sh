#!/bin/bash

directories=(
    "$HOME/projects/controlbox/bagtotee"
    "$HOME/projects/personal/fizz.nvim"
    "$HOME/projects/controlbox/letsbox"
    "/home/sebas/projects/controlbox/react.email"
    "$HOME/.config/nvim"
    "$HOME/.config/polybar"
    "$HOME/.config/kitty"
    "$HOME/.config/bspwm"
    "$HOME/.config/rofi"
    "$HOME/.config/sxhkd"
)

selected_directory=$(printf "%s\n" "${directories[@]}" | fzf --preview="ls {}")

if [ -n "$selected_directory" ]; then
    cd "$selected_directory" || exit
    nvim
fi
