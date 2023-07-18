#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROVER" == "true" ]; then
    if [ ! -f "./wait" ];then
        wget https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait
        chmod +x ./wait
    fi

    WAIT_HOSTS=zkevm-chain-prover-rpcd:${PORT_ZKEVM_CHAIN_PROVER_RPCD} WAIT_TIMEOUT=180 ./wait

    if [ "$ENABLE_PROVER" == "true" ]; then
        taiko-client prover \
        --l1.ws ${L2_ENDPOINT_WS} \
        --l2.ws ws://l3_execution_engine:8546 \
        --l1.http ${L2_ENDPOINT_HTTP} \
        --l2.http http://l3_execution_engine:8545 \
        --taikoL1 ${TAIKO_L1_ADDRESS} \
        --taikoL2 ${TAIKO_L2_ADDRESS} \
        --taikoProverPoolL1 ${PROVER_POOL_ADDRESS} \
        --zkevmRpcdEndpoint http://zkevm-chain-prover-rpcd:${PORT_ZKEVM_CHAIN_PROVER_RPCD} \
        --zkevmRpcdParamsPath /data \
        --l1.proverPrivKey ${L2_PROVER_PRIVATE_KEY} \
        --maxConcurrentProvingJobs 1 \
        --prover.proveUnassignedBlocks
    else
        taiko-client prover \
        --l1.ws ${L2_ENDPOINT_WS} \
        --l2.ws ws://l3_execution_engine:8546 \
        --l1.http ${L2_ENDPOINT_HTTP} \
        --l2.http http://l3_execution_engine:8545 \
        --taikoL1 ${TAIKO_L1_ADDRESS} \
        --taikoL2 ${TAIKO_L2_ADDRESS} \
        --taikoProverPoolL1 ${PROVER_POOL_ADDRESS} \
        --zkevmRpcdEndpoint http://zkevm-chain-prover-rpcd:${PORT_ZKEVM_CHAIN_PROVER_RPCD} \
        --zkevmRpcdParamsPath /data \
        --l1.proverPrivKey ${L2_PROVER_PRIVATE_KEY} \
        --maxConcurrentProvingJobs 1 \
        --prover.proveUnassignedBlocks=false
    fi
else
    sleep infinity
fi
