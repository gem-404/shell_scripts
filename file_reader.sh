#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Initialize arrays
lhs=()
rhs=()

# Read input and populate arrays
while IFS=' ' read -r num1 num2; do

    lhs+=("$num1")
    rhs+=("$num2")

    # echo "${num1}x5 is $(( num1 * 5 ))"
    # echo "${num2}x10 is $(( num2 * 10 ))"
    
done

# Properly display arrays
echo "lhs array is: ${lhs[@]}"
echo "rhs array is: ${rhs[@]}"
