#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROVER" == "true" ]; then
    mkdir -p /data

    rm -rf /data/kzg_bn254_21.srs && wget https://storage.googleapis.com/zkevm-circuits-keys/kzg_bn254_21.srs -P /data

    /prover_rpcd \
        --bind 0.0.0.0:9000 \
        --lookup l3_zkevm_chain_prover_rpcd:9000
else
    sleep infinity
fi
