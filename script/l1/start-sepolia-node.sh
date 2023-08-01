#!/bin/sh

set -eou pipefail

if [ "$START_L1_NODE" == "true" ]; then
    erigon \
        --datadir=/data/sepolia \
        --chain=sepolia \
        --http=true \
        --http.api=eth,web3,net,debug,txpool \
        --http.addr=0.0.0.0 \
        --http.vhosts=* \
        --http.corsdomain=* \
        --ws \
        --internalcl \
        --txpool.pricebump=0 \
        --maxpeers=100
else
    sleep infinity
fi
