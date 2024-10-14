#!/usr/bin/env bash

LOG_FILE="/home/gem-404/shell_scripts/internet_connection_checker.log"
DISPLAY=:0.0
DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

no_connection_icon="/home/gem-404/notify-send-icons/no-wireless-connection.png"
connection_icon="network-wireless"

# Function to check if a command exists
check_command() {

    if ! command -v "$1" &> /dev/null; then
        echo "$(date): $1 not installed" >> "$LOG_FILE"
        exit 1
    fi

}

# Function to send notifications
send_notification() {

    local icon="$1"
    local message="$2"
    local urgency="$3" # Default urgency to normal if not provided

    if command -v notify-send &> /dev/null; then
        notify-send -i "$icon" -u "$urgency" "$message"

        echo "$(date): Notification sent: $message with urgency $urgency" >> "$LOG_FILE"
    else
        echo "$(date): $message" >> "$LOG_FILE"
    fi

}

# Function to check internet connection
check_internet_connection() {

    local test_urls=("www.google.com" "www.github.com" "www.archlinux.org")

    local success=false

    for url in "${test_urls[@]}"; do
        if ping -c 1 "$url" &> /dev/null; then
            success=true
            break
        fi
    done

    if $success; then
        send_notification  "$connection_icon" "Internet Connection Active" "normal"
    else
        send_notification "$no_connection_icon" "No Internet Connection" "critical" 
    fi
}

# Main script execution
main() {

    echo "$(date): Script started" >> "$LOG_FILE"
    # Check if necessary commands are available
    check_command "ping"

    # Check internet connection and send notification
    check_internet_connection
    echo "$(date): Script finished" >> "$LOG_FILE"

}

# Export necessary environment variables
export DISPLAY
export DBUS_SESSION_BUS_ADDRESS

# Execute main function
main
