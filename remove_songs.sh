#!/bin/bash

# Get the current playlist with positions
playlist=$(mpc playlist -f "%position%. %title% - %artist%")

# Use fzf to select multiple songs to delete
selected=$(echo "$playlist" | fzf --multi --prompt="Select songs to delete: " --height=40% --reverse)

# Extract the positions of the selected songs
positions=$(echo "$selected" | awk -F '. ' '{print $1}')

# Remove the selected songs from the playlist
for pos in $positions; do
    mpc del "$pos"
done

echo "Selected songs removed from the playlist."
