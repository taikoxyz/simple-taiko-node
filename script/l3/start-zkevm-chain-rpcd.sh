#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROVER" == "true" ]; then
    mkdir -p /data

    rm -rf /data/kzg_bn254_21.srs && wget https://storage.googleapis.com/zkevm-circuits-keys/kzg_bn254_21.srs -P /data

    /prover_rpcd --bind 0.0.0.0:${PORT_ZKEVM_CHAIN_PROVER_RPCD}
else
    sleep infinity
fi
