#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROVER" == "true" ]; then
    if [ ! -f "./wait" ];then
        wget https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait
        chmod +x ./wait
    fi

    WAIT_HOSTS=l3_zkevm_chain_prover_rpcd:9000 WAIT_TIMEOUT=3600 ./wait


    ARGS="--l1.ws ${L2_ENDPOINT_WS}
        --l2.ws ws://l3_execution_engine:8546
        --l1.http ${L2_ENDPOINT_HTTP}
        --l2.http http://l3_execution_engine:8545
        --taikoL1 ${TAIKO_L1_ADDRESS}
        --taikoL2 ${TAIKO_L2_ADDRESS}
        --taikoProverPoolL1 ${PROVER_POOL_ADDRESS}
        --zkevmRpcdEndpoint http://l3_zkevm_chain_prover_rpcd:9000
        --zkevmRpcdParamsPath /data \
        --l1.proverPrivKey ${L2_PROVER_PRIVATE_KEY}
        --maxConcurrentProvingJobs ${ZKEVM_CHAIN_INSTANCES_NUM}"

    if [[ ! -z "$WAIT_RECEIPT_TIMEOUT" ]]; then
        ARGS="${ARGS} --rpc.waitReceiptTimeout ${WAIT_RECEIPT_TIMEOUT}"
    fi

    if [ "$PROVE_UNASSIGNED_BLOCKS" == "true" ]; then
        ARGS="${ARGS} --prover.proveUnassignedBlocks"
    fi

    taiko-client prover ${ARGS}
else
    sleep infinity
fi
