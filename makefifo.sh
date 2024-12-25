#!/bin/bash


# Create a named pipe
mkfifo data_pipe

# Writer process: Simulate data generation
(
    for i in {1..5}; do
        echo "Data item $i"
        sleep 1
    done
) > data_pipe &


# Reader process; Process data asynchronously
(
    while read -r line; do
        echo "Processing: $line"
    done < data_pipe
) &

# Wait for background processes to finish
wait


# Clean up
rm data_pipe
