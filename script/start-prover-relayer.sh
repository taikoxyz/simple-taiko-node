#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROVER" = "true" ]; then
    ARGS="--l1.ws ${L1_ENDPOINT_WS}
        --l2.ws ws://l2_execution_engine:8546
        --l1.http ${L1_ENDPOINT_HTTP}
        --l1.beacon ${L1_BEACON_HTTP}
        --l2.http http://l2_execution_engine:8545
        --taikoL1 ${TAIKO_L1_ADDRESS}
        --taikoL2 ${TAIKO_L2_ADDRESS}
        --taikoToken ${TAIKO_TOKEN_L1_ADDRESS}
        --assignmentHook ${ASSIGNMENT_HOOK_L1_ADDRESS}
        --l1.proverPrivKey ${L1_PROVER_PRIVATE_KEY}
        --prover.capacity ${PROVER_CAPACITY}
        --raiko.hostEndpoint ${SGX_RAIKO_HOST}
        --minTierFee.optimistic ${MIN_ACCEPTABLE_PROOF_FEE}
        --minTierFee.sgx ${MIN_ACCEPTABLE_PROOF_FEE}
        --minTierFee.sgxAndZkvm ${MIN_ACCEPTABLE_PROOF_FEE}"

    if [ -n "$PROVE_BLOCK_TX_GAS_LIMIT" ]; then
        ARGS="${ARGS} --tx.gasLimit ${PROVE_BLOCK_TX_GAS_LIMIT}"
    fi

    if [ -n "$TOKEN_ALLOWANCE" ]; then
        ARGS="${ARGS} --prover.allowance ${TOKEN_ALLOWANCE}"
    fi

    if [ -n "$MIN_ETH_BALANCE"]; then
        ARGS="${ARGS} --prover.minEthBalance ${MIN_ETH_BALANCE}"
    fi

     if [ -n "$MIN_TKO_BALANCE"]; then
        ARGS="${ARGS} --prover.minTaikoTokenBalance ${MIN_TKO_BALANCE}"
    fi

        if [ "$PROVE_UNASSIGNED_BLOCKS" = "true" ]; then
        ARGS="${ARGS} --prover.proveUnassignedBlocks"
    fi

    taiko-client prover ${ARGS}
else
    echo "PROVER IS DISABLED"
    sleep infinity
fi
