
#!/bin/sh

set -eou pipefail

ARGS="--l1.ws ${L1_ENDPOINT_WS}
    --l2.http http://l2_execution_engine:8545
    --taikoL1 ${TAIKO_L1_ADDRESS}
    --taikoL2 ${TAIKO_L2_ADDRESS}
    --l1.proposerPrivKey ${L1_PROPOSER_PRIVATE_KEY}
    --l2.suggestedFeeRecipient ${L2_SUGGESTED_FEE_RECIPIENT}
    --minimalBlockGasLimit 5000000"

if [[ ! -z "$TXPOOL_LOCALS" ]]; then
    ARGS="${ARGS} --txpool.localsOnly"
    ARGS="${ARGS} --txpool.locals ${TXPOOL_LOCALS}"
fi

if [[ ! -z "$PROPOSE_BLOCK_TX_GAS_LIMIT" ]]; then
    ARGS="${ARGS} --proposeBlockTxGasLimit ${PROPOSE_BLOCK_TX_GAS_LIMIT}"
fi

if [[ ! -z "$PROPOSE_BLOCK_TX_GAS_TIP_CAP" ]]; then
    ARGS="${ARGS} --proposeBlockTxGasTipCap ${PROPOSE_BLOCK_TX_GAS_TIP_CAP}"
fi

if [ "$ENABLE_PROPOSER" == "true" ]; then
    taiko-client proposer ${ARGS}
else
    sleep infinity
fi