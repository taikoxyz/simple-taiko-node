#!/bin/sh

set -eou pipefail

P2P_BOOTNODES="enr:-J64QDvU6s4LuxAegET9xidBag2zHNzBuU6cZ1IPStGx_U2nCU8vR8EZxjHmQYCfH08PJd_9BQErXfStUpiofXIRVquGAZcyLG_hgmlkgnY0gmlwhCIuHGOHb3BzdGFja4ThmAoAiXNlY3AyNTZrMaEC6luKeXmF9QCvo3ugPOR7ADl5KpQvCsm-6foZp6VBAnODdGNwgg-hg3VkcIK5ZA,enr:-J64QO9o3nZi9CPGlriurNJGJ7AttHdT6CuyHDM5QTVgHgm_LMy3ngOk47ENaRFfpiWWEUFDyEKYj9V60Ckhl84hvk-GAZcyLHhxgmlkgnY0gmlwhCIej3yHb3BzdGFja4ThmAoAiXNlY3AyNTZrMaEDQE6UkwZhB0Mb3z9Hu7Ngo1MkSmBpkDx2ko_KMGdXXyqDdGNwgg-hg3VkcIKx3A,enr:-J64QMhRPUng6b6X-1cDLc4QKiZMmBQJWqZtPY77LyFHp4hJfr9a7nO_-VjJy4uyHGiFb76Ke3IZIqcvSFRjhxbLDXWGAZcyKpHDgmlkgnY0gmlwhCI4NgiHb3BzdGFja4ThmAoAiXNlY3AyNTZrMaEDstCUreHOaJkIeLGXv4GL1B1bMuQBnULcY9kdcCD1MVODdGNwgg-hg3VkcIKGpA"

if [ "$DISABLE_P2P_SYNC" = "false" ]; then
    exec taiko-client driver \
        --l1.ws "${L1_ENDPOINT_WS}" \
        --l2.ws ws://l2_execution_engine:8546 \
        --l1.beacon "${L1_BEACON_HTTP}" \
        --l2.auth http://l2_execution_engine:8551 \
        --taikoInbox "${TAIKO_INBOX_ADDRESS}" \
        --taikoAnchor "${TAIKO_ANCHOR_ADDRESS}" \
        --preconfirmation.whitelist "${PRECONFIRMATION_WHITELIST}" \
        --jwtSecret /data/taiko-geth/geth/jwtsecret \
        --p2p.sync \
        --p2p.checkPointSyncUrl "${P2P_SYNC_URL}" \
        --p2p.bootnodes "${P2P_BOOTNODES}" \
        --p2p.listen.ip "0.0.0.0" \
        --p2p.disable false \
        --p2p.useragent "taiko" \
        --p2p.listen.tcp ${P2P_LISTEN_TCP_PORT} \
        --p2p.advertise.ip "${PUBLIC_IP}"

else
    exec taiko-client driver \
        --l1.ws "${L1_ENDPOINT_WS}" \
        --l2.ws ws://l2_execution_engine:8546 \
        --l1.beacon "${L1_BEACON_HTTP}" \
        --l2.auth http://l2_execution_engine:8551 \
        --taikoInbox "${TAIKO_INBOX_ADDRESS}" \
        --taikoAnchor "${TAIKO_ANCHOR_ADDRESS}" \
        --preconfirmation.whitelist "${PRECONFIRMATION_WHITELIST}" \
        --jwtSecret /data/taiko-geth/geth/jwtsecret\
        --p2p.bootnodes ${P2P_BOOTNODES} \
        --p2p.listen.ip "0.0.0.0" \
        --p2p.disable false \
        --p2p.useragent "taiko" \
        --p2p.listen.tcp ${P2P_LISTEN_TCP_PORT} \
        --p2p.advertise.ip "${PUBLIC_IP}"
fi
