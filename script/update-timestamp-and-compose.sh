#!/bin/bash

# Script to update TAIKO_INTERNAL_SHASTA_TIME to current time + 60 seconds
# and then run docker-compose up -d
#
# Usage: ./script/update-timestamp-and-compose.sh

set -e  # Exit on error

# Get the script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Calculate timestamp: current time + 60 seconds
NEW_TIMESTAMP=$(($(date +%s) + 60))
TIMESTAMP_READABLE=$(date -d "@$NEW_TIMESTAMP" '+%Y-%m-%d %H:%M:%S')

echo "Updating TAIKO_INTERNAL_SHASTA_TIME to: $NEW_TIMESTAMP ($TIMESTAMP_READABLE)"

# Update the .env file
ENV_FILE="$PROJECT_ROOT/.env"

if [ ! -f "$ENV_FILE" ]; then
    echo "Error: .env file not found at $ENV_FILE"
    exit 1
fi

# Update TAIKO_INTERNAL_SHASTA_TIME in .env file
sed -i "s/^TAIKO_INTERNAL_SHASTA_TIME=.*/TAIKO_INTERNAL_SHASTA_TIME=$NEW_TIMESTAMP/" "$ENV_FILE"

# Verify the update
UPDATED_VALUE=$(grep "^TAIKO_INTERNAL_SHASTA_TIME=" "$ENV_FILE" | cut -d'=' -f2)
echo "Updated value: $UPDATED_VALUE"
echo ""

# Change to project root directory
cd "$PROJECT_ROOT"

# Run docker-compose up -d
echo "Running: docker-compose up -d"
docker-compose up -d

