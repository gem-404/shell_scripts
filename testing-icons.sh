#!/usr/bin/env bash

# Define the list of icon names associated with lack of network connectivity
icons=(
    "list-add"
    "view-calendar-tasks"
    "edit"
    "list-add"
    "list-remove"
    "appointment"
    "appointment-new"
    "network-offline"
    "network-disconnected"
    "network-error"
    "network-wireless-disconnected"
    "network-wireless-offline"
    "network-wireless-no-signal"
    "network-wireless-low"
    "network-wireless-unavailable"
    "network-wireless-absent"
)

# Define a message to display with each icon
message="Testing Icon Availability"

# Define the urgency level
urgency="normal"

# Loop through each icon name
for icon in "${icons[@]}"; do
    echo "Testing icon: $icon"
    notify-send -i "$icon" "$message" "Testing $icon"
    sleep 2  # Pause for 2 seconds to allow time to view the notification
done
