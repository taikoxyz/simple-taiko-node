#!/bin/sh

set -eou pipefail

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the error_handling.sh script from the util directory
. "$SCRIPT_DIR/util/error_handling.sh"

if [ "$ENABLE_PROPOSER" = "true" ]; then
    ARGS="--l1.ws ${L1_ENDPOINT_WS}
        --l2.http http://l2_execution_engine:8545
        --l2.auth http://l2_execution_engine:8551
        --taikoL1 ${TAIKO_L1_ADDRESS}
        --taikoL2 ${TAIKO_L2_ADDRESS}
        --taikoToken ${TAIKO_TOKEN_L1_ADDRESS}
        --assignmentHookAddress ${ASSIGNMENT_HOOK_L1_ADDRESS}
        --jwtSecret /data/taiko-geth/geth/jwtsecret
        --l1.proposerPrivKey ${L1_PROPOSER_PRIVATE_KEY}
        --l2.suggestedFeeRecipient ${L2_SUGGESTED_FEE_RECIPIENT}
        --proverEndpoints ${PROVER_ENDPOINTS}
        --tierFee.optimistic ${BLOCK_PROPOSAL_FEE}
        --tierFee.sgx ${BLOCK_PROPOSAL_FEE}"

    if [ -z "$L1_ENDPOINT_WS" ]; then
        echo "Error: L1_ENDPOINT_WS must be non-empty"
        exit 1
    fi

    if [ -z "$L1_PROPOSER_PRIVATE_KEY" ]; then
        echo "Error: L1_PROPOSER_PRIVATE_KEY must be non-empty"
        exit 1
    fi

    if [ -z "$PROVER_ENDPOINTS" ]; then
        echo "Warning: PROVER_ENDPOINTS must be non-empty"
        exit 1
    fi

    if [ -n "$TXPOOL_LOCALS" ]; then
        ARGS="${ARGS} --txPool.localsOnly"
        ARGS="${ARGS} --txPool.locals ${TXPOOL_LOCALS}"
    fi

    if [ -n "$MAX_TIER_FEE_BUMPS" ]; then
        ARGS="${ARGS} --tierFee.maxPriceBumps ${MAX_TIER_FEE_BUMPS}"
    fi

    if [ -n "$BLOCK_BUILDER_TIP" ]; then
        ARGS="${ARGS} --l1.blockBuilderTip ${BLOCK_BUILDER_TIP}"
    fi

    if [ "$BLOB_ALLOWED" = "true" ]; then
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
fi

# Retry logic parameters
MAX_RETRIES=3
RETRY_DELAY=5

# Run the proposer with retries and handle error errors
for i in $(seq 1 $MAX_RETRIES); do
    exec taiko-client proposer ${ARGS} && break  # Exit loop on success
    echo "[$(date +"%Y-%m-%dT%H:%M:%S")] ERROR: Proposer failed to start (attempt $i/$MAX_RETRIES). Retrying in $RETRY_DELAY seconds..." >&2
    sleep $RETRY_DELAY
    RETRY_DELAY=$((RETRY_DELAY * 2))  # Exponential backoff
done

# If all retries fail, handle the error
handle_error "Failed to start proposer after $MAX_RETRIES retries. Check the logs for details."
