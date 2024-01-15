#!/bin/sh

set -eou pipefail

ARGS="--l1.ws ${L1_ENDPOINT_WS}
    --l2.http http://l2_execution_engine:8545
    --taikoL1 ${TAIKO_L1_ADDRESS}
    --taikoL2 ${TAIKO_L2_ADDRESS}
    --taikoToken ${TAIKO_TOKEN_L1_ADDRESS}
    --assignmentHookAddress ${ASSIGNMENT_HOOK_L1_ADDRESS}
    --l1.proposerPrivKey ${L1_PROPOSER_PRIVATE_KEY}
    --proverEndpoints ${PROVER_ENDPOINTS}
    --tierFee.optimistic ${BLOCK_PROPOSAL_FEE}
    --tierFee.sgx ${BLOCK_PROPOSAL_FEE}
    --tierFee.pseZKEvm ${BLOCK_PROPOSAL_FEE}"

if [ -n "$TXPOOL_LOCALS" ]; then
    ARGS="${ARGS} --txpool.localsOnly"
    ARGS="${ARGS} --txpool.locals ${TXPOOL_LOCALS}"
fi

if [ -n "$PROPOSE_BLOCK_TX_GAS_LIMIT" ]; then
    ARGS="${ARGS} --tx.gasLimit ${PROPOSE_BLOCK_TX_GAS_LIMIT}"
fi

if [ -n "$PROPOSE_BLOCK_TX_GAS_TIP_CAP" ]; then
    ARGS="${ARGS} --tx.gasTipCap ${PROPOSE_BLOCK_TX_GAS_TIP_CAP}"
fi

if [ "$ENABLE_PROPOSER" == "true" ]; then
    taiko-client proposer ${ARGS}
else
    echo "PROPOSER IS DISABLED"
    sleep infinity
fi
