#!/bin/sh

set -eou pipefail

L2_EE_HOST="${EXECUTION_ENGINE_ENDPOINT:-l2_execution_engine}"
JWT_SECRET_PATH="${JWT_PATH:-/data/taiko-geth/geth/jwtsecret}"

L2_WS="ws://${L2_EE_HOST}:8546"
L2_AUTH="http://${L2_EE_HOST}:8551"

if [ "$DISABLE_P2P_SYNC" = "false" ]; then
    exec taiko-client driver \
        --l1.ws "${L1_ENDPOINT_WS}" \
        --l2.ws "${L2_WS}" \
        --l1.beacon "${L1_BEACON_HTTP}" \
        --l2.auth "${L2_AUTH}" \
        --taikoL1 "${TAIKO_L1_ADDRESS}" \
        --taikoL2 "${TAIKO_L2_ADDRESS}" \
        --jwtSecret "${JWT_SECRET_PATH}" \
        --p2p.sync \
        --p2p.checkPointSyncUrl "${P2P_SYNC_URL}"
else
    exec taiko-client driver \
        --l1.ws "${L1_ENDPOINT_WS}" \
        --l2.ws "${L2_WS}" \
        --l1.beacon "${L1_BEACON_HTTP}" \
        --l2.auth "${L2_AUTH}" \
        --taikoL1 "${TAIKO_L1_ADDRESS}" \
        --taikoL2 "${TAIKO_L2_ADDRESS}" \
        --jwtSecret "${JWT_SECRET_PATH}"
fi
