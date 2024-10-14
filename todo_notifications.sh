#!/usr/bin/env bash

export DISPLAY=:0.0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

ideas_file="/home/gem-404/new_ideas/new_ideas.txt"

temp_file=$(mktemp)

# Remove extra blank lines, ensuring only one blank line separates tasks
awk 'NF {print $0 "\n" }' RS= "$ideas_file" | sed '/^$/d' > "$temp_file"

# Replace the original ideas file with the preprocessed temp file
mv "$temp_file" "$ideas_file"

mapfile -t undone_tasks < <(grep -v "==> DONE" "$ideas_file")

# Function to send notifications for each undone task
send_notifications() {
    if command -v notify-send &> /dev/null; then

        for task in "${undone_tasks[@]}"; do
            notify-send "$task";
            sleep 2
        done

    else

        echo "notify-send command not found"

    fi
}

main() {
    send_notifications
}

# Execute main function
main
