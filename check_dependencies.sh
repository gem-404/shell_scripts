#!/usr/bin/env bash

dependencies=(alacritty base-devel bat brightnessctl bspwm dunst eza feh firefox geany git kitty imagemagick jq \
			        jgmenu libwebp maim mpc mpd neovim ncmpcpp npm pamixer pacman-contrib \
			        papirus-icon-theme physlock picom playerctl polybar polkit-gnome python-gobject ranger \
			        redshift rofi rustup sxhkd tmux ttf-inconsolata ttf-jetbrains-mono ttf-jetbrains-mono-nerd \
			        ttf-joypixels ttf-terminus-nerd ueberzug webp-pixbuf-loader xclip xdg-user-dirs \
			        xdo xdotool xorg-xdpyinfo xorg-xkill xorg-xprop xorg-xrandr xorg-xsetroot \
			        xorg-xwininfo zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting rofi-greenclip)

is_installed() {
    pacman -Q "$1" &> /dev/null
}

for mod in "${dependencies[@]}"; do

    if ! is_installed "$mod"; then
        printf "module %s is not installed \n" "$mod"
    fi

done
