#!/usr/bin/env bash

is_installed() {
    pacman -Q "$1" &> /dev/null
}

if ! is_installed mpc; then
    echo "mpc not found in system"
    exit 1
fi

if ! command -v mpc &> /dev/null; then
    echo "mpc not found in system"
    exit 1
fi


mpc update

folder="/home/gem-404/old_school_music"

# for file in $(ls "$folder"); do
#     mpc add "$file"
# done

cd "$folder" || exit 1

for file in "*.mp3"; do
    if [[ -f "$file" ]]; then
        # Add MP3 file to MPD playlist
        mpc add "$file"
    fi
done


# find "$folder" -type f -name "*mp3" -print0 | while IFS= read -r -d '' file; do
#     # Add each file to MPD playlist
#     mpc add "$file"
# done

