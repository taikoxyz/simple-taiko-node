#!/bin/sh

set -eou pipefail

P2P_BOOTNODES="enode://ea5b8a797985f500afa37ba03ce47b0039792a942f0ac9bee9fa19a7a5410273fe43b4e8a9a28fa42cdec1b6435deb809fcb79479c55cc2ddbaf02de7a83f456@35.239.142.239:4001?discport=30304,enode://404e9493066107431bdf3f47bbb360a353244a6069903c76928fca3067575f2adf62ef396b0a8a74696669ef53cab8373e38ddd9b3d3d2d76f356d2cd2708951@34.63.118.244:4001?discport=30304,enode://b2d094ade1ce68990878b197bf818bd41d5b32e4019d42dc63d91d7020f531532f063833e44e84f78792969f69fd5553370216703c40fcc0cb835f17177fbe07@34.63.52.157:4001?discport=30304"

ARGS="--l1.ws ${L1_ENDPOINT_WS} \
    --l2.ws ws://l2_execution_engine:8546 \
    --l1.beacon ${L1_BEACON_HTTP} \
    --l2.auth http://l2_execution_engine:8551 \
    --taikoInbox ${TAIKO_INBOX_ADDRESS} \
    --taikoAnchor ${TAIKO_ANCHOR_ADDRESS} \
    --verbosity ${VERBOSITY} \
    --preconfirmation.whitelist ${PRECONFIRMATION_WHITELIST} \
    --jwtSecret /data/taiko-geth/geth/jwtsecret"

if [ -n "$BLOB_SERVER_URL" ]; then
    ARGS="${ARGS} --blob.server ${BLOB_SERVER_URL}"
fi

if [ "$DISABLE_P2P_SYNC" = "false" ]; then
    ARGS="${ARGS} --p2p.sync \
    --p2p.checkPointSyncUrl ${P2P_SYNC_URL}"
fi

if [ "$ENABLE_PRECONFS_P2P" = "true" ]; then
  ARGS="${ARGS} --p2p.peerstore.path /node-keys/peerstore \
      --p2p.discovery.path /node-keys/discv5 \
      --preconfirmation.serverPort 9871 \
      --p2p.listen.ip 0.0.0.0 \
      --p2p.useragent taiko \
      --p2p.bootnodes ${P2P_BOOTNODES}"

  if [ -z "$PRIV_FILE" ] && [ -z "$PRIV_RAW" ]; then
      echo "Error: Either PRIV_FILE or PRIV_RAW must be provided" >&2
      exit 1
  fi

  if [ -n "$PRIV_RAW" ]; then
      ARGS="${ARGS} --p2p.priv.raw ${PRIV_RAW}"
  else
      SOURCE_FILE="/script/$PRIV_FILE"
      DEST_FILE="/data/private-key/$PRIV_FILE"

      if [ -f "$SOURCE_FILE" ]; then
          cp "$SOURCE_FILE" "$DEST_FILE"
          chmod 600 "$DEST_FILE"
      else
        echo "Error: /script/$PRIV_FILE does not exist"
        exit 1
      fi

      ARGS="${ARGS} --p2p.priv.path $DEST_FILE"
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
fi

exec taiko-client driver ${ARGS}
