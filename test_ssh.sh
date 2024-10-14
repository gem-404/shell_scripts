#!/bin/bash

# Define arrays for target VMs and key files
targets=(
  "ec2-user@ec2-54-151-25-1.us-west-1.compute.amazonaws.com"
  "ec2-user@ec2-54-193-64-209.us-west-1.compute.amazonaws.com"
  "ec2-user@ec2-18-144-156-90.us-west-1.compute.amazonaws.com"
  "ec2-user@ec2-13-57-34-228.us-west-1.compute.amazonaws.com"
  "ec2-user@ec2-54-215-190-108.us-west-1.compute.amazonaws.com"
)

keys=(
  "/usr/local/mousetrap/IT54-VM1.pem"
  "/usr/local/mousetrap/IT54-VM2.pem"
  "/usr/local/mousetrap/IT514-VM3.pem"
  "/usr/local/mousetrap/IT54-VM4.pem"
  # Add the path to IT514-VM5.pem if it exists
  # "/usr/local/mousetrap/IT514-VM5.pem"
)

# Function to test SSH connection
test_ssh() {
  local target=$1
  local key=$2
  
  echo "Testing SSH with key $key to target $target..."
  
  # Test SSH connection, suppress the output and only check for success
  if ssh -i "$key" -o StrictHostKeyChecking=no -o BatchMode=yes -o ConnectTimeout=10 "$target" exit 2>/dev/null; then
    echo "SUCCESS: Key $key can SSH to $target"
  else
    echo "FAILURE: Key $key cannot SSH to $target"
  fi
}

# Iterate over each target VM and key file combination
for target in "${targets[@]}"; do
  for key in "${keys[@]}"; do
    test_ssh "$target" "$key"
  done
done
