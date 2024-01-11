#!/bin/bash

set -eou pipefail

if [ "$ENABLE_PROVER" = "true" ]; then
    mkdir -p /data

    wget https://storage.googleapis.com/zkevm-circuits-keys/kzg_bn254_22.srs -P /data

    /prover_rpcd \
        --bind 0.0.0.0:9000 \
        --lookup zkevm_chain_prover_rpcd:9000
else
    sleep infinity
fi
