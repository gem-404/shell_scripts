#!/bin/bash

# Temporary file to hold selections
temp_file=$(mktemp)

# Function to clean up temporary file on exit
cleanup() {
    rm -f "$temp_file"
}

trap cleanup EXIT

# Main loop for selecting items with fzf
while true; do
    # List and filter fonts, then launch fzf for selection
    selection=$(ls /usr/share/figlet/fonts | grep "fl" | cut -f 1 -d "." | fzf -m --preview 'figlet -f {} hello world')

    # Break the loop if no selection is made (e.g., fzf is exited with ESC or Ctrl+C)
    if [ -z "$selection" ]; then
        break
    fi

    # Append the selection to the temporary file
    echo "$selection" >> "$temp_file"
done

# Append all collected selections to the final file when fzf is done
cat "$temp_file" >> selected_fonts.txt
echo "Selected fonts appended to selected_fonts.txt."
