#!/bin/bash

# Clone simple-taiko-node
# git clone https://github.com/taikoxyz/simple-taiko-node.git
# cd simple-taiko-node
# printf "\n"

echo Taiko Node Setup Script v0

# Copy the sample .env files
echo Getting environmental variables...
cp .env.sample .env

# get api key
echo Setting L1 archive node endpoints
read -p 'Enter HTTP endpoint: ' http_key
read -p 'Enter WS endpoint: ' ws_key
# set L1_ENDPOINT_HTTP and  L1_ENDPOINT_WS
sed  '/\[L1_ENDPOINT_HTTP\]/a http_key' .env > /dev/null
sed  '/\[L1_ENDPOINT_WS\]/a ws_key' .env > /dev/null
printf "\xE2\x9C\x94 Configuration was successful! \n"
printf "\n"

# If you ran a testnet node previously, remove old volumes
#docker compose down -v

# Start a node using Docker
echo Starting docker container...
sudo docker compose up -d > /dev/null
printf "\xE2\x9C\x94 Node started! \n"
printf "\n"

# Verify node is running
echo Verifying node is running...

# Check if the Execution Layer client is connected to Taiko L2
echo Check the Execution Layer client is connected to Taiko L2
curl -s http://localhost:8547 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_chainId","params":[],"id":1,"jsonrpc":"2.0"}' \
  | grep "0x28c5f" &> /dev/null
if [ $? == 0 ]
then
    printf "\xE2\x9C\x94 Client is connected. \n"
else
    echo Error connecting the client.
fi

# Check if the Execution Layer client is synced
echo Check the Execution Layer client is synced
curl -s http://localhost:8547 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_blockNumber","params":[],"id":1,"jsonrpc":"2.0"}' \
  | grep "0x0" &> /dev/null
if [ $? == 0 ]
  then
    printf "\xE2\x9C\x94 Client is synced. \n"
else
echo Error syncing the client.
fi

# If blockNumber is not growing, check the Taiko L2 logs
#sudo docker compose logs -f

# Operate the node (stop node, update node, remove node, view logs)
echo To view the node dashboard, open http://localhost:3001/d/L2ExecutionEngine/l2-execution-engine-overview
