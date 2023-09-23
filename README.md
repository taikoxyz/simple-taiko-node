<p align="center">
  <img src="taiko-icon-blk.svg" width="80" alt="Logo for Taiko" />
</p>

<h1 align="center">
  Taiko
</h1>

<p align="center">
  A decentralized, Ethereum-equivalent ZK-Rollup.
</p>

<div align="center">

[![Twitter Follow](https://img.shields.io/twitter/follow/taikoxyz?style=social)](https://twitter.com/taikoxyz)
[![Discord](https://img.shields.io/discord/984015101017346058?color=%235865F2&label=Discord&logo=discord&logoColor=%23fff)](https://discord.gg/taikoxyz)
[![GitPOAP Badge](https://public-api.gitpoap.io/v1/repo/taikoxyz/taiko-mono/badge)](https://www.gitpoap.io/gh/taikoxyz/taiko-mono)
[![License](https://img.shields.io/github/license/taikoxyz/taiko-mono)](https://github.com/taikoxyz/taiko-mono/blob/main/LICENSE.md)

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/taikoxyz/taiko-mono/protocol.yml?branch=main&label=Protocol&logo=github)](https://github.com/taikoxyz/taiko-mono/actions/workflows/protocol.yml)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/taikoxyz/taiko-mono/relayer.yml?branch=main&label=Relayer&logo=github)](https://github.com/taikoxyz/taiko-mono/actions/workflows/relayer.yml)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/taikoxyz/taiko-mono/bridge-ui-v2.yml?branch=main&label=Bridge%20UI&logo=github)](https://github.com/taikoxyz/taiko-mono/actions/workflows/bridge-ui.yml)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/taikoxyz/taiko-mono/website.yml?branch=main&label=Website&logo=github)](https://github.com/taikoxyz/taiko-mono/actions/workflows/website.yml)

</div>

# Run a Taiko Node

[This guide](https://taiko.xyz/docs/guides/run-a-taiko-node) will help you start up a Taiko RPC node.

## Prerequisites

- [Docker](https://docs.docker.com/engine/install/) is installed and running.
- [Git](https://github.com/git-guides/install-git/) is installed.
- Meet the [Geth minimum hardware requirements](https://github.com/ethereum/go-ethereum#hardware-requirements), except for the storage requirement. As of 2023-09-18, a node uses less than 10 GB. 100 GB should be future-proof enough if you intend to run your node for a while.

## Steps

### 1. Clone simple-taiko-node

```bash
git clone https://github.com/taikoxyz/simple-taiko-node.git
cd simple-taiko-node
git config core.autocrlf false
```

### 2. Copy the sample .env files

```bash
cp .env.sample .env
```

### 3. Set the required values in the .env file

**First**, open the .env in your preferred text editor:

```bash
notepad .env
```

**Next**, you will set the L1 archive node endpoints.

You can get a L1 endpoint from a few places, but it **must point to an archive node** to access the state trie beyond the last 128 blocks.

**Recommended**: Run your own Sepolia archive node, see: Run a Sepolia node. This is recommended because you will eventually be rate-limited by public RPC providers.

**Alternative**: [Alchemy](https://www.alchemy.com) and [Infura](https://www.infura.io) are two popular RPC providers. Make sure you select the RPC as Sepolia testnet, and not Ethereum mainnet.

#### Local

If you are running a local Sepolia node, you cannot reference the L1 endpoints as http://127.0.0.1:8545 and ws://127.0.0.1:8546 because that is local to inside the simple-taiko-node Docker image. Depending on your firewall setup, you can do a few things. You can try:

Using host.docker.internal (see: [stack overflow](https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach))
Using the private ip address of your machine (use something like ip addr show to get this ip address)

**Finally**, set the following L1 node endpoints in your .env file:

L1_ENDPOINT_HTTP
L1_ENDPOINT_WS
Take a look at the comments above these values in the .env.sample to see how to set them up.

### 4. Start a node

Make sure Docker is running and then run the following command to start the node:

```bash
sudo docker compose up -d
```

### 5. Verify node is running

#### Check with the node dashboard

A node dashboard will be running on localhost on the GRAFANA_PORT you set in your .env file, which defaults to 3001: http://localhost:3001/d/L2ExecutionEngine/l2-execution-engine-overview.

You can verify that your node is syncing by checking the **chain head** on the dashboard and seeing that it is increasing. Once the chain head matches what's on the block explorer, you are fully synced.

#### Check with curl commands

1. Check if the Execution Layer client is connected to Taiko L2:

```bash
curl http://localhost:8547 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_chainId","params":[],"id":1,"jsonrpc":"2.0"}'
```

which should return the chainId as 0x28c5f (167007):

```bash
{ "jsonrpc": "2.0", "id": 1, "result": "0x28c5f" }
```

2. Check if the Execution Layer client is synced by requesting the latest Taiko L2 / L3 block from the Execution Layer client:

```bash
curl http://localhost:8547 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_blockNumber","params":[],"id":1,"jsonrpc":"2.0"}'
```

3. If the blockNumber response value is 0 or not growing, check the Taiko L2 logs here:

```bash
sudo docker compose logs -f
```

If you find an error, check the [Node troubleshooting page](https://taiko.xyz/docs/reference/node-troubleshooting).

![image](https://github.com/fonckchain/simple-taiko-node/assets/30877952/ecbc4434-3c55-43cc-ab08-37471668f73f)

### 6. Operate the node

You can find all node operations (eg. stop node, update node, remove node, view logs) in the [Node runner manual](https://taiko.xyz/docs/manuals/node-runner-manual).

## Videos

- [Run a Taiko L2 node (YouTube)](https://www.youtube.com/watch?v=l_tVvDcuK5o) (deprecated, but still useful)

## Troubleshooting

- View the [Node troubleshooting reference](https://taiko.xyz/docs/reference/node-troubleshooting) for help on any common error codes / issues.
- View the logs of the node (see all log commands in the [Node runner manual](https://taiko.xyz/docs/manuals/node-runner-manual)).
