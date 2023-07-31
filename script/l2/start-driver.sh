#!/bin/sh

set -eou pipefail

if ["$START_L2_NODE" == "false"] then;
    sleep infinity
elif [ "$L2_DISABLE_P2P_SYNC" == "false" ]; then
    taiko-client driver \
        --l1.ws ${L1_ENDPOINT_WS} \
        --l2.ws ws://l2_execution_engine:8546 \
        --l2.auth http://l2_execution_engine:8551 \
        --taikoL1 ${TAIKO_L1_ADDRESS_ON_L1} \
        --taikoL2 ${TAIKO_L2_ADDRESS_ON_L2} \
        --jwtSecret /data/taiko-geth/geth/jwtsecret \
        --p2p.syncVerifiedBlocks \
        --p2p.checkPointSyncUrl https://rpc.test.taiko.xyz \
        --p2p.syncTimeout "5000"
else
    taiko-client driver \
        --l1.ws ${L1_ENDPOINT_WS} \
        --l2.ws ws://l2_execution_engine:8546 \
        --l2.auth http://l2_execution_engine:8551 \
        --taikoL1 ${TAIKO_L1_ADDRESS_ON_L1} \
        --taikoL2 ${TAIKO_L2_ADDRESS_ON_L2} \
        --jwtSecret /data/taiko-geth/geth/jwtsecret
fi
