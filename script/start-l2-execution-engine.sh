#!/bin/sh

if [ "$L2_EXECUTION_ENGINE" = "nethermind" ]; then
    exec /nethermind/nethermind \
        --config ${NETWORK} \
        --datadir /data/nethermind \
        --JsonRpc.Enabled true \
        --JsonRpc.EnabledModules "Eth, Net, Parity, Personal, Proof, Rpc, Subscribe, Trace, TxPool, Web3, Taiko" \
        --Init.WebSocketsEnabled true \
        --JsonRpc.WebSocketsPort ${PORT_L2_EXECUTION_ENGINE_WS} \
        --JsonRpc.Host 0.0.0.0 \
        --JsonRpc.Port 8545 \
        --Network.DiscoveryPort "${PORT_L2_EXECUTION_ENGINE_P2P}" \
        --Network.P2PPort "${PORT_L2_EXECUTION_ENGINE_P2P}" \
        --JsonRpc.EngineHost 0.0.0.0 \
        --JsonRpc.EnginePort 8551 \
        --Network.MaxActivePeers "${MAXPEERS:-50}" \
        --Metrics.Enabled true \
        --Metrics.ExposePort 6060 \
        --JsonRpc.JwtSecretFile /data/jwt/secret
else
    exec geth \
      --taiko \
      --networkid "${CHAIN_ID}" \
      --gcmode archive \
      --datadir /data/taiko-geth \
      --metrics \
      --metrics.addr "0.0.0.0" \
      --bootnodes ${BOOT_NODES} \
      --authrpc.addr "0.0.0.0" \
      --authrpc.vhosts "*" \
      --authrpc.jwtsecret /data/jwt/secret \
      --http \
      --http.api debug,eth,net,web3,txpool,taiko \
      --http.addr "0.0.0.0" \
      --http.vhosts "*" \
      --ws \
      --ws.api debug,eth,net,web3,txpool,taiko \
      --ws.addr "0.0.0.0" \
      --ws.port ${PORT_L2_EXECUTION_ENGINE_WS} \
      --ws.origins "*" \
      --gpo.defaultprice "10000000" \
      --port ${PORT_L2_EXECUTION_ENGINE_P2P} \
      --discovery.port ${PORT_L2_EXECUTION_ENGINE_P2P} \
      --maxpeers ${MAXPEERS:-50} \
      --maxpendpeers ${MAXPENDPEERS:-0} \
      ${GETH_ADDITIONAL_ARGS:-} 
fi
