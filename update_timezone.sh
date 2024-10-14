#!/usr/bin/env bash

# Get current apparent IP location
LOCATION=$(curl -s https://ipinfo.io | jq -r '.timezone')

# Check if the location was found
if [ -n "$LOCATION" ]; then
    # Set the system time zone
    sudo timedatectl set-timezone "$LOCATION"
    echo "Time zone set to $LOCATION"
else
    echo "Could not determine the apparent location."
fi
