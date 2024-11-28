#!/bin/bash

# Load environment variables
source .env

# Function to get access token
get_access_token() {
    curl -s -X POST https://api.datacrunch.io/v1/oauth2/token \
        -H "Content-Type: application/json" \
        -d "{\"grant_type\": \"client_credentials\", \"client_id\": \"$CLIENT_ID\", \"client_secret\": \"$CLIENT_SECRET\"}" | jq -r '.access_token'
}

# Function to get all instances
get_instances() {
    curl -s -H "Authorization: Bearer $1" https://api.datacrunch.io/v1/instances | jq .
}

# Function to start an instance
start_instance() {
    curl -s -X PUT https://api.datacrunch.io/v1/instances/action \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $1" \
        -d "{\"id\": \"$2\", \"action\": \"start\"}"
}

# Main script
ACCESS_TOKEN=$(get_access_token)
INSTANCES=$(get_instances "$ACCESS_TOKEN")

# Loop through instances and start any in 'hibernating' state
echo "$INSTANCES" | jq -c '.[]' | while read -r instance; do

    echo "$instance" | jq

    STATUS=$(echo "$instance" | jq -r '.status')
    INSTANCE_ID=$(echo "$instance" | jq -r '.id')

    if [ "$STATUS" == "hibernating" ]; then
        echo "Starting instance $INSTANCE_ID..."
        start_instance "$ACCESS_TOKEN" "$INSTANCE_ID"
    fi
done

echo "Script completed."
