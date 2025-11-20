#!/bin/bash

# Script to deploy the Alethia protocol
# Usage: ./script/alethia-deployer.sh

set -e  # Exit on error

export DEVNET_CHAIN_ID=${L1_CHAIN_ID}

# Determine beacon URL - use L1_BEACON_HTTP if set, otherwise use host.docker.internal for Docker containers
BEACON_URL=${L1_BEACON_HTTP:-http://host.docker.internal:33001}
echo "Using beacon URL: $BEACON_URL"

# Fetch and validate DEVNET_BEACON_GENESIS
BEACON_GENESIS_RAW=$(curl -s "$BEACON_URL/eth/v1/beacon/genesis" | jq -r '.data.genesis_time')
echo "Raw DEVNET_BEACON_GENESIS value: '$BEACON_GENESIS_RAW'"

# Check if jq returned "null" (as a string) or empty
if [ -z "$BEACON_GENESIS_RAW" ] || [ "$BEACON_GENESIS_RAW" = "null" ]; then
    echo "Error: DEVNET_BEACON_GENESIS is empty or null. Beacon service may not be ready."
    echo "Tried to fetch from: $BEACON_URL/eth/v1/beacon/genesis"
    exit 1
fi

export DEVNET_BEACON_GENESIS="$BEACON_GENESIS_RAW"
echo "DEVNET_BEACON_GENESIS exported as: $DEVNET_BEACON_GENESIS"

export DEVNET_SECONDS_IN_SLOT=$(curl -s "$BEACON_URL/eth/v1/config/spec" | jq -r '.data.SECONDS_PER_SLOT')
export DEVNET_OP_CHANGE_DELAY="0"
export DEVNET_RANDOMNESS_DELAY="0"
export FOUNDRY_PROFILE="layer1"
export L2_CHAIN_ID=${L2_CHAIN_ID}
export PRIVATE_KEY="0x$CONTRACT_OWNER_PRIVATE_KEY"
export OLD_FORK_TAIKO_INBOX="0x0000000000000000000000000000000000000000"
export TAIKO_TOKEN="0x0000000000000000000000000000000000000000"
export TAIKO_ANCHOR_ADDRESS=${TAIKO_ANCHOR_ADDRESS}
export L2_SIGNAL_SERVICE="0x1670010000000000000000000000000000000005"
export CONTRACT_OWNER=${CONTRACT_OWNER}
export PROVER_SET_ADMIN=${CONTRACT_OWNER}
export TAIKO_TOKEN_PREMINT_RECIPIENT=${CONTRACT_OWNER}
export TAIKO_TOKEN_NAME="Taiko Token"
export TAIKO_TOKEN_SYMBOL="TAIKO"
export SHARED_RESOLVER="0x0000000000000000000000000000000000000000"
export L2_GENESIS_HASH="0x560214ec5cf2d01f8dbbeb8062c5f187cd8a356fa6e0faa577767566e2f570ad"
export PAUSE_BRIDGE="true"
export DEPLOY_PRECONF_CONTRACTS="true"
export PRECONF_INBOX="false"
export PRECONF_ROUTER="false"
export INCLUSION_WINDOW="24"
export INCLUSION_FEE_IN_GWEI="100"
export DUMMY_VERIFIERS="true"
export PROPOSER_ADDRESS=${CONTRACT_OWNER}
export SECURITY_COUNCIL=${CONTRACT_OWNER}
export FORK_URL=${L1_ENDPOINT_HTTP}
export FORGE_FLAGS="--broadcast --ffi -vvv --block-gas-limit 200000000"
export ACTIVATE_INBOX="false"

# Verify the variable is set before calling setup.sh
echo "Verifying DEVNET_BEACON_GENESIS before setup.sh: $DEVNET_BEACON_GENESIS"

./setup.sh && forge script ./script/layer1/core/DeployProtocolOnL1.s.sol:DeployProtocolOnL1 --private-key $CONTRACT_OWNER_PRIVATE_KEY --fork-url $L1_ENDPOINT_HTTP --broadcast --ffi -vvv --block-gas-limit 200000000

cp /app/deployments/deploy_l1.json /deployments/deploy_l1_shasta.json
