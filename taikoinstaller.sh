#!/bin/bash

# Created with passion by @iwantanode

configureEnvironment()
{
  local ENABLE=$1
  local PRIVATE_KEY_TYPE=$2
  local GAS_LIMIT_TYPE=$3
  local GAS_LIMIT=$4

echo "Enabling prover/proposer.....0%"
echo "Enabling prover/proposer.....40%"
echo "Enabling prover/proposer.....100%"
echo "$ENABLE=false"
sed -i "s|$ENABLE=false|$ENABLE=true|" .env

#Prompt the user for the layer1 private key
read -p "Enter layer 1 private key NOT WITH REAL $ " PRIVATE_KEY

# Update the private key
sed -i "s|$PRIVATE_KEY_TYPE=|$PRIVATE_KEY_TYPE=${PRIVATE_KEY}|" .env
echo "Adding private key.....0%"
echo "Adding private key.....40%"
echo "Adding private key.....100%"

# Set tx gas limit PROVE_BLOCK_TX_GAS_LIMIT
sed -i "s|$GAS_LIMIT_TYPE=|$GAS_LIMIT_TYPE=$GAS_LIMIT|" .env
}

configureBeneficiaryAddress()
{
  local L2_RECIPIENT=$1
   read -p "Enter A L2 account address who will be the tx fee beneficiary of the L2 blocks that you proposed " L2_SUGGESTED_FEE_RECIPIENT
   sed -i "s|$L2_RECIPIENT=|$L2_RECIPIENT=${L2_SUGGESTED_FEE_RECIPIENT}|" .env
}


# Check if docker is installed, else install it
if command -v docker &>/dev/null; then
  echo "Docker is already installed."
else
echo "Docker is not installed. Installing..."

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

# Check if Git is installed
if command -v git &>/dev/null; then
  echo "Git is already installed."
else
   echo "Installing git"
  sudo apt-get install git-all
fi

# Clone the repository
git clone https://github.com/taikoxyz/simple-taiko-node.git

# Go to the cloned repo
cd simple-taiko-node

# Copy env file
cp .env.sample .env

read -p "Enter L1_ENDPOINT_HTTP: (you can get it -> https://infura.io/) " L1_ENDPOINT_HTTP

# Prompt the user for L1_ENDPOINT_WS input
read -p "Enter L1_ENDPOINT_WS: (you can get it -> https://infura.io/) " L1_ENDPOINT_WS

# Update the configuration file
sed -i "s|L1_ENDPOINT_HTTP=|L1_ENDPOINT_HTTP=${L1_ENDPOINT_HTTP}|" .env
sed -i "s|L1_ENDPOINT_WS=|L1_ENDPOINT_WS=${L1_ENDPOINT_WS}|" .env

echo "Configuration updated with the following values:"
echo "L1_ENDPOINT_HTTP=${L1_ENDPOINT_HTTP}"
echo "L1_ENDPOINT_WS=${L1_ENDPOINT_WS}"

# Chosing between prover, proposer or both to be installed

echo "Please enter a value for what do you want to install"
echo "If you want to be a prover who generates and submits zero knowledge proofs of proposed L2 blocks, press A "
echo "If you want to be a proposer who proposes L2 execution engine's transactions in mempool to Taiko L1 protocol press B "
echo "If you want to be both press C "

read choice
case $choice in
  "A" | "a")
    echo "You selected option A."
    configureEnvironment "ENABLE_PROVER" "L1_PROVER_PRIVATE_KEY" "PROVE_BLOCK_TX_GAS_LIMIT" "10000000000"

    ;;
  "B" | "b")
    echo "You selected option B."
        configureEnvironment "ENABLE_PROPOSER" "L1_PROPOSER_PRIVATE_KEY" "PROPOSE_BLOCK_TX_GAS_LIMIT" "80000000"
        configureBeneficiaryAddress "L2_SUGGESTED_FEE_RECIPIENT"
    ;;
  "C" | "c")
    echo "You selected option C."
        configureEnvironment "ENABLE_PROVER" "L1_PROVER_PRIVATE_KEY" "PROVE_BLOCK_TX_GAS_LIMIT" "10000000000"
        configureEnvironment "ENABLE_PROPOSER" "L1_PROPOSER_PRIVATE_KEY" "PROPOSE_BLOCK_TX_GAS_LIMIT" "80000000"
        configureBeneficiaryAddress "L2_SUGGESTED_FEE_RECIPIENT"
   ;;
  *)
    echo "Invalid choice. Please select A, B, or C."
    ;;
esac


#Start the node
docker compose up -d
