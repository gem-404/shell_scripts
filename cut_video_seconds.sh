#!/bin/bash

# Usage: ./cut_last_20_seconds.sh input_video output_video

input_video="$1"
output_video="$2"
cut_duration=20

# Get the total duration of the video in seconds
total_duration=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$input_video")

# Calculate the start time for the last 20 seconds
start_time=$(echo "$total_duration - $cut_duration" | bc)

# Use ffmpeg to cut the last 20 seconds
ffmpeg -i "$input_video" -ss "$start_time" -t "$cut_duration" -c copy "$output_video"
