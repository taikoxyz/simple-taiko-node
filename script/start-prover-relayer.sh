#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROVER" = "true" ]; then
    if [ ! -f "./wait" ];then
        wget https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait
        chmod +x ./wait
    fi

    WAIT_HOSTS=zkevm_chain_prover_rpcd:9000 WAIT_TIMEOUT=360 ./wait

    ARGS="--l1.ws ${L1_ENDPOINT_WS}
        --l2.ws ws://l2_execution_engine:8546
        --l1.http ${L1_ENDPOINT_HTTP}
        --l2.http http://l2_execution_engine:8545
        --taikoL1 ${TAIKO_L1_ADDRESS}
        --taikoL2 ${TAIKO_L2_ADDRESS}
        --taikoToken ${TAIKO_TOKEN_L1_ADDRESS}
        --assignmentHook ${ASSIGNMENT_HOOK_L1_ADDRESS}
        --zkevm.rpcdEndpoint http://zkevm_chain_prover_rpcd:9000
        --zkevm.rpcdParamsPath /data
        --raiko.hostEndpoint ${SGX_RAIKO_HOST}
        --l1.proverPrivKey ${L1_PROVER_PRIVATE_KEY}
        --minTierFee.optimistic ${MIN_ACCEPTABLE_PROOF_FEE}
        --minTierFee.sgx ${MIN_ACCEPTABLE_PROOF_FEE}
        --minTierFee.pseZKEvm ${MIN_ACCEPTABLE_PROOF_FEE}
        --prover.capacity ${ZKEVM_CHAIN_INSTANCES_NUM}"

    if [ -n "$PROVE_BLOCK_TX_GAS_LIMIT" ]; then
        ARGS="${ARGS} --tx.gasLimit ${PROVE_BLOCK_TX_GAS_LIMIT}"
    fi

    if [ -n "$TOKEN_ALLOWANCE" ]; then
        ARGS="${ARGS} --prover.allowance ${TOKEN_ALLOWANCE}"
    fi

    if [ "$PROVE_UNASSIGNED_BLOCKS" = "true" ]; then
        ARGS="${ARGS} --prover.proveUnassignedBlocks"
    fi

    taiko-client prover ${ARGS}
else
    sleep infinity
fi
