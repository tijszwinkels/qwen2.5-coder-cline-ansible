#!/bin/bash

# Read host information from hosts.ini
HOST_INFO=$(grep -v '^#' hosts.ini | grep -v '^\[')

# Extract hostname, username, and private key path
HOSTNAME=$(echo $HOST_INFO | awk '{print $1}')
USERNAME=$(echo $HOST_INFO | awk '{print $2}' | cut -d'=' -f2)
PRIVATE_KEY_PATH=$(echo $HOST_INFO | awk '{print $3}' | cut -d'=' -f2)

# Start SSH tunnel
ssh -i $PRIVATE_KEY_PATH -L 11435:localhost:11434 $USERNAME@$HOSTNAME
