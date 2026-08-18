#!/bin/sh

set -eou pipefail

P2P_BOOTNODES="enode://c263741b17759f3850d24d67d6c3cbc307c73e17d80c6b12a63a4792a10529d1125d00ecf7ef4c9b0dc51d28b94dfc1b8798fb524f61a1f93946748649f73b23@34.142.239.251:4001?discport=30304,enode://67c739e00a9b6476fce8f9d3cf0ae12589c325c51520da75c2dbfe5094d5c9ef72abf0e368316b10e8332b96e1886869164113a86b66f7f8b989ed0d8dee8895@34.126.181.0:4001?discport=30304,enode://a31855cd5c4138327617bde2e87418774d03c40cd7217344e24f6d906a8ca72c777d65ed9bd38b20e03fa5f91302ae690b00963cd490011c549189ac24e0d1b9@34.21.195.34:4001?discport=30304"

JWT_SECRET="/data/alethia-reth/jwtsecret"

if [ "${COMPOSE_PROFILES:-}" = "geth_execution_engine" ] || [ "${COMPOSE_PROFILES:-}" = "l2_execution_engine" ]; then
  JWT_SECRET="/data/taiko-geth/geth/jwtsecret"
fi

ARGS="--l1.ws ${L1_ENDPOINT_WS} \
    --l2.ws ws://l2_execution_engine:8546 \
    --l1.beacon ${L1_BEACON_HTTP} \
    --l2.auth http://l2_execution_engine:8551 \
    --inbox ${TAIKO_INBOX_ADDRESS} \
    --taikoAnchor ${TAIKO_ANCHOR_ADDRESS} \
    --verbosity ${VERBOSITY} \
    --jwtSecret ${JWT_SECRET}"

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
      --preconfirmation.jwtSecret ${JWT_SECRET} \
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
