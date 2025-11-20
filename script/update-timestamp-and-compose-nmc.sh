#!/bin/bash

# Script to update TAIKO_INTERNAL_SHASTA_TIME to current time + 60 seconds
# and then run docker-compose up -d
#
# Usage: ./script/update-timestamp-and-compose.sh

set -e  # Exit on error

# Get the script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Change to project root directory
cd "$PROJECT_ROOT"

# Check if docker-compose containers exist (running or stopped)
EXISTING_CONTAINERS=$(docker-compose ps -q 2>/dev/null | wc -l)

if [ "$EXISTING_CONTAINERS" -eq 0 ]; then
    # First time running - update timestamp
    echo "First time running docker-compose. Updating TAIKO_INTERNAL_SHASTA_TIME..."

    # Calculate timestamp: current time + 60 seconds
    NEW_TIMESTAMP=$(($(date +%s) + 60))
    
    # Cross-platform date formatting (works on both macOS and Linux)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS (BSD date)
        TIMESTAMP_READABLE=$(date -r "$NEW_TIMESTAMP" '+%Y-%m-%d %H:%M:%S')
    else
        # Linux (GNU date)
        TIMESTAMP_READABLE=$(date -d "@$NEW_TIMESTAMP" '+%Y-%m-%d %H:%M:%S')
    fi

    echo "Updating TAIKO_INTERNAL_SHASTA_TIME to: $NEW_TIMESTAMP ($TIMESTAMP_READABLE)"

    # Update the .env file
    ENV_FILE="$PROJECT_ROOT/.env"

    if [ ! -f "$ENV_FILE" ]; then
        echo "Error: .env file not found at $ENV_FILE"
        exit 1
    fi

    # Update TAIKO_INTERNAL_SHASTA_TIME in .env file
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS (BSD sed) - requires extension argument
        sed -i '' "s/^TAIKO_INTERNAL_SHASTA_TIME=.*/TAIKO_INTERNAL_SHASTA_TIME=$NEW_TIMESTAMP/" "$ENV_FILE"
    else
        # Linux (GNU sed) - no extension needed
        sed -i "s/^TAIKO_INTERNAL_SHASTA_TIME=.*/TAIKO_INTERNAL_SHASTA_TIME=$NEW_TIMESTAMP/" "$ENV_FILE"
    fi

    # Verify the update
    UPDATED_VALUE=$(grep "^TAIKO_INTERNAL_SHASTA_TIME=" "$ENV_FILE" | cut -d'=' -f2)
    echo "Updated value: $UPDATED_VALUE"
    echo ""
else
    # Containers already exist - skip timestamp update
    echo "Docker-compose containers already exist. Skipping timestamp update."
    echo ""
fi

# Run docker-compose up -d
echo "Running: docker-compose -f docker-compose-nethermind.yml up -d"
docker-compose -f docker-compose-nethermind.yml up -d

