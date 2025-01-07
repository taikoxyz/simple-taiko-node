#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROPOSER" = "true" ]; then
    ARGS="--l1.ws ${L1_ENDPOINT_WS}
        --l2.http http://l2-nethermind-execution-client:${L2_HTTP_PORT}
        --l2.auth http://l2-nethermind-execution-client:${L2_ENGINE_API_PORT}
        --taikoL1 ${TAIKO_L1_ADDRESS}
        --taikoL2 ${TAIKO_L2_ADDRESS}
        --jwtSecret /tmp/jwt/jwtsecret
        --l1.proposerPrivKey ${L1_PROPOSER_PRIVATE_KEY}
        --l2.suggestedFeeRecipient ${L2_SUGGESTED_FEE_RECIPIENT}"

    if [ -z "$L1_ENDPOINT_WS" ]; then
        echo "Error: L1_ENDPOINT_WS must be non-empty"
        exit 1
    fi

    if [ -z "$L1_PROPOSER_PRIVATE_KEY" ]; then
        echo "Error: L1_PROPOSER_PRIVATE_KEY must be non-empty"
        exit 1
    fi

    if [ -n "$CHECK_PROFITABILITY" ]; then
        ARGS="${ARGS} --checkProfitability=${CHECK_PROFITABILITY}"
    fi

    if [ -n "$ALLOW_EMPTY_BLOCKS" ]; then
        ARGS="${ARGS} --allowEmptyBlocks=${ALLOW_EMPTY_BLOCKS}"
    fi

    if [ -n "$SURGE_PROPOSING_BLOCK_GAS" ]; then
        ARGS="${ARGS} --surge.gasNeededForProposingBlock ${SURGE_PROPOSING_BLOCK_GAS}"
    fi

    if [ -n "$SURGE_PROVING_BLOCK_GAS" ]; then
        ARGS="${ARGS} --surge.gasNeededForProvingBlock ${SURGE_PROVING_BLOCK_GAS}"
    fi

    if [ -n "$SURGE_OFF_CHAIN_COSTS" ]; then
        ARGS="${ARGS} --surge.offChainCosts ${SURGE_OFF_CHAIN_COSTS}"
    fi

    if [ -n "$SURGE_PRICE_FLUCTUATION_MODIFIER" ]; then
        ARGS="${ARGS} --surge.priceFluctuationModifier ${SURGE_PRICE_FLUCTUATION_MODIFIER}"
    fi

    if [ -n "$EPOCH_INTERVAL" ]; then
        ARGS="${ARGS} --epoch.interval ${EPOCH_INTERVAL}"
    fi

    if [ -n "$EPOCH_MIN_TIP" ]; then
        ARGS="${ARGS} --epoch.minTip ${EPOCH_MIN_TIP}"
    fi

    if [ -n "$PROVER_SET" ]; then
        ARGS="${ARGS} --proverSet ${PROVER_SET}"
    fi

    if [ -n "$TXPOOL_LOCALS" ]; then
        ARGS="${ARGS} --txPool.localsOnly"
        ARGS="${ARGS} --txPool.locals ${TXPOOL_LOCALS}"
    fi

    if [ "$BLOB_ALLOWED" == "true" ]; then
        ARGS="${ARGS} --l1.blobAllowed"
    fi

    # TXMGR Settings
    if [ -n "$TX_FEE_LIMIT_MULTIPLIER" ]; then
            ARGS="${ARGS} --tx.feeLimitMultiplier ${TX_FEE_LIMIT_MULTIPLIER}"
    fi

    if [ -n "$TX_FEE_LIMIT_THRESHOLD" ]; then
        ARGS="${ARGS} --tx.feeLimitThreshold ${TX_FEE_LIMIT_THRESHOLD}"
    fi

    if [ -n "$TX_GAS_LIMIT" ]; then
        ARGS="${ARGS} --tx.gasLimit ${TX_GAS_LIMIT}"
    fi

    if [ -n "$TX_MIN_BASEFEE" ]; then
        ARGS="${ARGS} --tx.minBaseFee ${TX_MIN_BASEFEE}"
    fi

    if [ -n "$TX_MIN_TIP_CAP" ]; then
        ARGS="${ARGS} --tx.minTipCap ${TX_MIN_TIP_CAP}"
    fi

    if [ -n "$TX_NOT_IN_MEMPOOL_TIMEOUT" ]; then
        ARGS="${ARGS} --tx.notInMempoolTimeout ${TX_NOT_IN_MEMPOOL_TIMEOUT}"
    fi

    if [ -n "$TX_NUM_CONFIRMATIONS" ]; then
        ARGS="${ARGS} --tx.numConfirmations ${TX_NUM_CONFIRMATIONS}"
    fi

    if [ -n "$TX_RECEIPT_QUERY_INTERVAL" ]; then
        ARGS="${ARGS} --tx.receiptQueryInterval ${TX_RECEIPT_QUERY_INTERVAL}"
    fi

    if [ -n "$TX_RESUBMISSION" ]; then
        ARGS="${ARGS} --tx.resubmissionTimeout ${TX_RESUBMISSION}"
    fi

    if [ -n "$TX_SAFE_ABORT_NONCE_TOO_LOW" ]; then
        ARGS="${ARGS} --tx.safeAbortNonceTooLowCount ${TX_SAFE_ABORT_NONCE_TOO_LOW}"
    fi

    if [ -n "$TX_SEND_TIMEOUT" ]; then
        ARGS="${ARGS} --tx.sendTimeout ${TX_SEND_TIMEOUT}"
    fi

    echo "Executing command: taiko-client proposer ${ARGS}"
    exec taiko-client proposer ${ARGS}
else
    echo "PROPOSER IS DISABLED"
    sleep infinity
fi
