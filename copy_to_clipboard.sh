#!/bin/bash

# Paths to your text files
XCLIP="/usr/bin/xclip"
FILE_WELCOME="$HOME/welcome.txt"
FILE_FOLLOWUP="$HOME/welcome-follow-up.txt"

# Check if xclip is installed
if ! command -v xclip &>/dev/null; then
  echo "Error: xclip is not installed. Please install it and try again."
  exit 1
fi

# Function to copy file content to clipboard
copy_to_clipboard() {
  local file=$1
  if [[ -f "$file" ]]; then
    xclip -selection clipboard < "$file"
    echo "Content of $(basename "$file") copied to clipboard."
  else
    echo "Error: File '$file' not found."
  fi
}

# Handle input argument
case "$1" in

  f1)
    copy_to_clipboard "$FILE_WELCOME"
    ;;

  f2)
    copy_to_clipboard "$FILE_FOLLOWUP"
    ;;

  *)
    echo "Usage: $0 {f1|f2}"
    echo "  f1: Copy welcome.txt to clipboard"
    echo "  f2: Copy welcome-follow-up.txt to clipboard"
    exit 1
    ;;

esac
