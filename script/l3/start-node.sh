#!/bin/sh

set -eou pipefail

if [ "$START_L3_NODE" == "true" ]; then
    geth \
        --taiko
        --networkid="${L3_CHAIN_ID}"
        --syncmode=full
        --gcmode=archive
        --datadir=/data/taiko-geth
        --metrics
        --metrics.expensive
        --metrics.addr="0.0.0.0"
        --bootnodes=${L3_BOOT_NODES}
        --authrpc.addr="0.0.0.0"
        --authrpc.vhosts="*"
        --http
        --http.api=debug,eth,net,web3,txpool,taiko
        --http.addr="0.0.0.0"
        --http.vhosts="*"
        --ws
        --ws.api=debug,eth,net,web3,txpool,taiko
        --ws.addr="0.0.0.0"
        --ws.origins="*"
else
    sleep infinity
fi
