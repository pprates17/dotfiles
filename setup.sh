#! /bin/bash

programs=("
    aerospace
    bluetooth
    btop
    devices
    ghostty
    hyprland
    kanata
    kitty
    lazydocker
    lazygit
    nvim
    opencode
    packages
    README
    rofi
    setup
    sketchybar
    skhd
    starship
    tmux
    wallpappers
    waybar
    wezterm
    wlogout
    yabai
    yazi
    zsh
")
 
for program in "${programs[@]}"; do
    echo $program
