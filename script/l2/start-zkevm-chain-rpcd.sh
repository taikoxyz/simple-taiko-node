#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROVER" == "true" ]; then
    mkdir -p /data

    if [ ! -f "/data/19.bin" ];then
        wget https://storage.googleapis.com/zkevm-circuits-keys/19.bin -P /data
    fi

    /prover_rpcd \
        --bind 0.0.0.0:9000 \
        --lookup zkevm_chain_prover_rpcd:9000
else
    sleep infinity
fi
