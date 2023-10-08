#!/bin/bash

# Created with passion by @iwantanode

# Clone the repository
git clone https://github.com/taikoxyz/simple-taiko-node.git

# Go to the cloned repo
cd simple-taiko-node

# Copy env file
cp .env.sample .env

# Prompt the user for L1_ENDPOINT_HTTP input
read -p "Enter L1_ENDPOINT_HTTP: " L1_ENDPOINT_HTTP

# Prompt the user for L1_ENDPOINT_WS input
read -p "Enter L1_ENDPOINT_WS: " L1_ENDPOINT_WS

# Update the configuration file
sed -i "s|L1_ENDPOINT_HTTP=|L1_ENDPOINT_HTTP=${L1_ENDPOINT_HTTP}|" .env
sed -i "s|L1_ENDPOINT_WS=|L1_ENDPOINT_WS=${L1_ENDPOINT_WS}|" .env

echo "Configuration updated with the following values:"
echo "L1_ENDPOINT_HTTP=${L1_ENDPOINT_HTTP}"
echo "L1_ENDPOINT_WS=${L1_ENDPOINT_WS}"
echo "Enabling prover.....0%"
echo "Enabling prover.....40%"
echo "Enabling prover.....100%"
sed -i "s|ENABLE_PROVER=false|ENABLE_PROVER=true|" .env

#Prompt the user for the layer1 private key
read -p "Enter layer 1 private key NOT WITH REAL $ " L1_PROVER_PRIVATE_KEY

# Update the private key
sed -i "s|L1_PROVER_PRIVATE_KEY=|L1_PROVER_PRIVATE_KEY=${L1_PROVER_PRIVATE_KEY}|" .env
echo "Adding private key.....0%"
echo "Adding private key.....40%"
echo "Adding private key.....100%"

# Set tx gas limit PROVE_BLOCK_TX_GAS_LIMIT
sed -i "s|PROVE_BLOCK_TX_GAS_LIMIT=|PROVE_BLOCK_TX_GAS_LIMIT=10000000000|" .env

#Start the node
docker compose up -d