#!/bin/sh

set -eou pipefail

if [ "$L3_DISABLE_P2P_SYNC" == "false" ]; then
    taiko-client driver \
        --l1.ws ${L2_ENDPOINT_WS} \
        --l2.ws ws://l3_execution_engine:8546 \
        --l2.auth http://l3_execution_engine:8551 \
        --taikoL1 ${TAIKO_L1_ADDRESS_ON_L2} \
        --taikoL2 ${TAIKO_L2_ADDRESS_ON_L3} \
        --jwtSecret /data/taiko-geth/geth/jwtsecret \
        --p2p.syncVerifiedBlocks \
        --p2p.checkPointSyncUrl https://rpc.l3test.taiko.xyz \
        --p2p.syncTimeout "5000"
else if [ "$L3_DISABLE_P2P_SYNC" == "true" ]; then
    taiko-client driver \
        --l1.ws ${L2_ENDPOINT_WS} \
        --l2.ws ws://l3_execution_engine:8546 \
        --l2.auth http://l3_execution_engine:8551 \
        --taikoL1 ${TAIKO_L1_ADDRESS_ON_L2} \
        --taikoL2 ${TAIKO_L2_ADDRESS_ON_L3} \
        --jwtSecret /data/taiko-geth/geth/jwtsecret
else
    sleep infinity
fi
