#!/usr/bin/env bash
set -euo pipefail


FILES_DIR="/home/gem-404/beef"


for file in "$FILES_DIR"/*; do
    {
        echo "Processing $file"
        sleep 2
        echo "Finished Processing $file"
    } &
done


# Wait for all background processes to finish
wait

echo "All files processed"


