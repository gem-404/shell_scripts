#!/bin/bash

set -euo pipefail

SESSION="coding_sesh"
WINDOW1="coding_window"
WINDOW2="testing_window"

is_installed() {
    pacman -Q "$1" > /dev/null 2>&1
}

# Check if tmux, cava and tty-clock are installed.
if ! is_installed tmux || ! is_installed cava || ! is_installed tty-clock; then
    echo -e "\n\e[00;31mInstall packages before proceeding {tmux, cava, tty-clock}\e[00m"
    exit 1
fi

# Check if the session already exists
if tmux has-session -t $SESSION 2>/dev/null; then
  echo "Session '$SESSION' already exists. Attaching..."
  tmux attach-session -t $SESSION
  exit 0
fi

tmux new-session -d -s $SESSION -n $WINDOW1

tmux_window_creator() {

    local session_name=$1
    local window_name=$2

    if [ "$window_name" != "$WINDOW1" ]; then
        tmux new-window -t $session_name -n $window_name
    fi

    tmux split-window -v -p 10 -t $session_name:$window_name  # 87% top pane
    tmux split-window -h -p 50 -t $session_name:$window_name

    tmux send-keys -t $session_name:$window_name.2 "cava" C-m  # Pane 2 -> bottom-left
    tmux send-keys -t $session_name:$window_name.3 "tty-clock -cnD" C-m  # Pane 3 -> bottom-right

}

tmux_window_creator $SESSION $WINDOW1
tmux_window_creator $SESSION $WINDOW2

tmux select-window -t $SESSION:$WINDOW1

# Attach to the session
tmux attach-session -t $SESSION
