#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

wallpaper_folder="/home/gem-404/wallpapers"

# Choose a random file from wallpapers...
len_wallpaper_folder=$(ls "$wallpaper_folder" | wc -l)

random_num_from_folder=$(( RANDOM % len_wallpaper_folder ))

# Use mapfile to read the directory contents into an array
mapfile -t wallpapers < <(ls "$wallpaper_folder")

wallpaper_file="${wallpapers[random_num_from_folder]}"

if ! command -v wal &> /dev/null; then
    notify-send "Wal is not installed on your system"
    exit 1
# else
#     wal -qi "$wallpaper_folder/$wallpaper_file"
fi

# picom.conf
file1="/home/gem-404/.config/bspwm/picom.conf"

sed -i 's/^corner-radius = 0$/corner-radius = 20;/' $file1

# alacritty/fonts.toml
file2="/home/gem-404/.config/alacritty/fonts.toml"

sed -i 's/^size = 11$/size = 8/' $file2
