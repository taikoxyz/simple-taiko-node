#!/bin/sh

set -eou pipefail

P2P_BOOTNODES="enode://b2d094ade1ce68990878b197bf818bd41d5b32e4019d42dc63d91d7020f531532f063833e44e84f78792969f69fd5553370216703c40fcc0cb835f17177fbe07@34.63.52.157:4001?discport=30304,enode://ea5b8a797985f500afa37ba03ce47b0039792a942f0ac9bee9fa19a7a5410273fe43b4e8a9a28fa42cdec1b6435deb809fcb79479c55cc2ddbaf02de7a83f456@35.239.142.239:4001?discport=30304"

ARGS="--l1.ws ${L1_ENDPOINT_WS} \
    --l2.ws ws://l2_execution_engine:8546 \
    --l1.beacon ${L1_BEACON_HTTP} \
    --l2.auth http://l2_execution_engine:8551 \
    --inbox ${TAIKO_INBOX_ADDRESS} \
    --taikoAnchor ${TAIKO_ANCHOR_ADDRESS} \
    --verbosity ${VERBOSITY} \
    --jwtSecret /data/alethia-reth/jwtsecret"

if [ "$DISABLE_P2P_SYNC" = "false" ]; then
    ARGS="${ARGS} --p2p.sync \
    --p2p.syncTimeout 24h \
    --p2p.checkPointSyncUrl ${P2P_SYNC_URL}"
fi

if [ "$ENABLE_PRECONFS_P2P" = "true" ]; then
  ARGS="${ARGS} --preconfirmation.serverPort 9871 \
      --preconfirmation.jwtSecret /data/alethia-reth/jwtsecret \
      --p2p.disable=false \
      --p2p.listen.ip 0.0.0.0 \
      --p2p.useragent taiko \
      --p2p.bootnodes ${P2P_BOOTNODES}"

  if [ -n "$PUBLIC_IP" ]; then
      ARGS="${ARGS} --p2p.advertise.ip ${PUBLIC_IP} \
      --p2p.advertise.udp ${P2P_UDP_PORT} \
      --p2p.listen.udp ${P2P_UDP_PORT} \
      --p2p.advertise.tcp ${P2P_TCP_PORT} \
      --p2p.listen.tcp ${P2P_TCP_PORT}"
  else
      ARGS="${ARGS} --p2p.nat"
  fi
fi

exec taiko-client driver ${ARGS}
