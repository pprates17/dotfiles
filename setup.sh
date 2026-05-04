#! /bin/bash

programs=("
    btop
    ghostty
    hyprland
    lazydocker
    lazygit
    nvim
    opencode
    rofi
    starship
    tmux
    wallpappers
    waybar
    wlogout
    yazi
    zsh
")

options=" --dotfiles"

if [ $# -eq 1 ]; then
    if [ $1 == "--delete" ] || [ $1 == "-D" ]; then
	options+=" -D"
    fi
fi

stow $options $programs 
