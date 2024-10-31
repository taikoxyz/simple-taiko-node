#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROVER" = "true" ]; then
    ARGS="--l1.ws ${L1_ENDPOINT_WS}
        --l2.ws ws://l2_execution_engine:8546
        --l2.http http://l2_execution_engine:8545
        --taikoL1 ${TAIKO_L1_ADDRESS}
        --taikoL2 ${TAIKO_L2_ADDRESS}
        --taikoToken ${TAIKO_TOKEN_L1_ADDRESS}
        --l1.proverPrivKey ${L1_PROVER_PRIVATE_KEY}
        --prover.capacity ${PROVER_CAPACITY}
        --raiko.host ${SGX_RAIKO_HOST}"

    if [ -z "$SGX_RAIKO_HOST" ]; then
        echo "Error: SGX_RAIKO_HOST must be non-empty"
        exit 1
    fi

    if [ -z "$L1_ENDPOINT_WS" ]; then
        echo "Error: L1_ENDPOINT_WS must be non-empty"
        exit 1
    fi

    if [ -z "$L1_PROVER_PRIVATE_KEY" ]; then
        echo "Error: L1_PROVER_PRIVATE_KEY must be non-empty"
        exit 1
    fi

    if [ -n "$PROVER_SET" ]; then
        ARGS="${ARGS} --proverSet ${PROVER_SET}"
    fi

    if [ -n "$TOKEN_ALLOWANCE" ]; then
        ARGS="${ARGS} --prover.allowance ${TOKEN_ALLOWANCE}"
    fi

    if [ -n "$MIN_ETH_BALANCE" ]; then
        ARGS="${ARGS} --prover.minEthBalance ${MIN_ETH_BALANCE}"
    fi

    if [ -n "$MIN_TAIKO_BALANCE" ]; then
        ARGS="${ARGS} --prover.minTaikoTokenBalance ${MIN_TAIKO_BALANCE}"
    fi

    if [ "$PROVE_UNASSIGNED_BLOCKS" = "true" ]; then
        ARGS="${ARGS} --prover.proveUnassignedBlocks"
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

    if [ -n "$TX_NOT_IN_MEMPOOL" ]; then
        ARGS="${ARGS} --tx.notInMempoolTimeout ${TX_NOT_IN_MEMPOOL}"
    fi

    if [ -n "$TX_NUM_CONFIRMATIONS" ]; then
        ARGS="${ARGS} --tx.numConfirmations ${TX_NUM_CONFIRMATIONS}"
    fi

    if [ -n "$TX_RECEIPT_QUERY" ]; then
        ARGS="${ARGS} --tx.receiptQueryInterval ${TX_RECEIPT_QUERY}"
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

    exec taiko-client prover ${ARGS}
else
    echo "PROVER IS DISABLED"
    sleep infinity
fi
