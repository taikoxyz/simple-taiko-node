#!/bin/sh

set -eou pipefail

if [ "$ENABLE_PROVER" = "true" ]; then
    ARGS="--l1.ws ${L1_ENDPOINT_WS}
        --l2.ws ws://l2-nethermind-execution-client:${L2_WS_PORT}
        --l2.http http://l2-nethermind-execution-client:${L2_HTTP_PORT}
        --taikoL1 ${TAIKO_L1_ADDRESS}
        --taikoL2 ${TAIKO_L2_ADDRESS}
        --l1.proverPrivKey ${L1_PROVER_PRIVATE_KEY}
        --prover.capacity ${PROVER_CAPACITY}
        --sgxVerifier ${SGX_VERIFIER}
        --sp1Verifier ${SP1_VERIFIER}
        --risc0Verifier ${RISC0_VERIFIER}
        --raiko.host ${SGX_RAIKO_HOST}
        --verbosity 4" # logging debug level and above

    if [ -z "$SGX_RAIKO_HOST" ]; then
        echo "Error: SGX_RAIKO_HOST must be non-empty"
        exit 1
    fi

    if [ -z "$L1_ENDPOINT_WS" ]; then
        echo "Error: L1_ENDPOINT_WS must be non-empty"
        exit 1
    fi

    if [ -z "$L1_ENDPOINT_HTTP" ]; then
        echo "Error: L1_ENDPOINT_HTTP must be non-empty"
        exit 1
    fi

    if [ -z "$L1_PROVER_PRIVATE_KEY" ]; then
        echo "Error: L1_PROVER_PRIVATE_KEY must be non-empty"
        exit 1
    fi

    if [ -n "$RAIKO_HOST_ZKVM" ]; then
        ARGS="${ARGS} --raiko.host.zkvm ${RAIKO_HOST_ZKVM}"
    fi

    if [ -n "$RAIKO_REQUEST_TIMEOUT" ]; then
        ARGS="${ARGS} --raiko.requestTimeout ${RAIKO_REQUEST_TIMEOUT}"
    fi

    if [ -n "$RAIKO_SP1_RECURSION" ]; then
        ARGS="${ARGS} --raiko.sp1Recursion ${RAIKO_SP1_RECURSION}"
    fi

    if [ -n "$RAIKO_SP1_PROVER" ]; then
        ARGS="${ARGS} --raiko.sp1Prover ${RAIKO_SP1_PROVER}"
    fi

    if [ -n "$RAIKO_RISC0_BONSAI" ]; then
        ARGS="${ARGS} --raiko.risc0Bonsai ${RAIKO_RISC0_BONSAI}"
    fi

    if [ -n "$RAIKO_RISC0_SNARK" ]; then
        ARGS="${ARGS} --raiko.risc0Snark ${RAIKO_RISC0_SNARK}"
    fi

    if [ -n "$RAIKO_RISC0_PROFILE" ]; then
        ARGS="${ARGS} --raiko.risc0Profile ${RAIKO_RISC0_PROFILE}"
    fi

    if [ -n "$RAIKO_RISC0_EXECUTION_PO2" ]; then
        ARGS="${ARGS} --raiko.risc0ExecutionPo2 ${RAIKO_RISC0_EXECUTION_PO2}"
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

    exec taiko-client prover ${ARGS}
else
    echo "PROVER IS DISABLED"
    sleep infinity
fi
