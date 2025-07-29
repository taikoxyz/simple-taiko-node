#!/bin/sh

set -eou pipefail

P2P_BOOTNODES="enode://c263741b17759f3850d24d67d6c3cbc307c73e17d80c6b12a63a4792a10529d1125d00ecf7ef4c9b0dc51d28b94dfc1b8798fb524f61a1f93946748649f73b23@34.142.239.251:4001?discport=30304,enode://2f37c3affd83274b262fa2a259d32d41510dd5a48d6e916696efe7f1598cb3f905305f5989e7b6607aab50697fb2e52cb4b6904116ed67cc5fcea1e6d66ccaba@35.247.159.156:4001?discport=30304,enode://dd83dedeff622ecfca0c5edf320266506c811539a553ddd91589cdfcc9bbd74d0d620f251d8d5e1180f19a446abbdd8b6b5301e9aa6cbad35cfd9716f80f2416@34.126.90.255:4001?discport=30304"

ARGS="--l1.ws "${L1_ENDPOINT_WS}" \
    --l2.ws ws://l2_execution_engine:8546 \
    --l1.beacon "${L1_BEACON_HTTP}" \
    --l2.auth http://l2_execution_engine:8551 \
    --taikoInbox "${TAIKO_INBOX_ADDRESS}" \
    --taikoAnchor "${TAIKO_ANCHOR_ADDRESS}" \
    --verbosity ${VERBOSITY} \
    --preconfirmation.whitelist ${PRECONFIRMATION_WHITELIST} \
    --preconfirmation.serverPort 9871 \
    --jwtSecret /data/taiko-geth/geth/jwtsecret \
    --p2p.bootnodes ${P2P_BOOTNODES} \
    --p2p.listen.ip 0.0.0.0 \
    --p2p.useragent taiko"

if [ "$DISABLE_P2P_SYNC" = "false" ]; then
    ARGS="${ARGS} --p2p.sync \
        --p2p.checkPointSyncUrl ${P2P_SYNC_URL}"
fi

if [ -n "$PUBLIC_IP" ]; then
    ARGS="${ARGS} --p2p.advertise.ip ${PUBLIC_IP} \
    --p2p.advertise.udp ${P2P_UDP_PORT} \
    --p2p.listen.udp ${P2P_UDP_PORT} \
    --p2p.advertise.tcp ${P2P_TCP_PORT} \
    --p2p.listen.tcp ${P2P_TCP_PORT}"
else
    ARGS="${ARGS} --p2p.nat"
fi

exec taiko-client driver ${ARGS}
