#!/bin/sh

set -eu pipefail

wget https://storage.googleapis.com/zkevm-circuits-keys/kzg_bn254_22.srs -P /data

/prover_rpcd \
    --bind 0.0.0.0:9000 \
    --lookup zkevm_chain_prover_rpcd:9000
