# simple-taiko-node

> Inspired by https://github.com/smartcontracts/simple-optimism-node

Start your Taiko node with a one line command.

## Prerequisite

- [Docker](https://docs.docker.com/engine/install/) is installed and running.
- [Git](https://github.com/git-guides/install-git/) is installed.
- Should have some ETH on the Layer 1 (L1) network. You can get some from the [L1 faucet](https://l1faucet.a1.taiko.xyz/).

## Instructions

### Clone this repository

```sh
git clone https://github.com/taikoxyz/simple-taiko-node.git
cd simple-taiko-node
```

### Configure your node

Copy `.env.sample` to `.env`.

```sh
cp .env.sample .env
```

To run your node as a proposer, configure the optional environment variables in this `.env` file:
- Set `ENABLE_PROPOSER` to `true` (replacing the default `false` with `true`).
- Set `L1_PROPOSER_PRIVATE_KEY` to that of your wallet's private key -- it will need some balance on layer 1 to propose blocks.
- Set `L2_SUGGESTED_FEE_RECIPIENT` to the layer 2 address you want to receive the tx fees from the block.

Finally you can save the `.env` and start proposing by starting up your node again. 

### Run the node

#### Start

```sh
docker compose up
```

This command starts the configured node. If you want to run it in the background, please add the `-d` flag (`docker compose up -d`).

If this is the first time you start the node, it will synchronize from the genesis to the present, which may take some time. You can monitor this progress through logs or in the local grafana dashboard and see the latest L2 chain status in [Taiko Alpha-1 L2 block explorer](https://l2explorer.a1.taiko.xyz/).

#### Stats (CPU/MEM USAGE %)
```sh
docker stats
```
This command will show you live data stream of your running containers (CPU/MEM USAGE %), consumption of your machine resources. Add prefix "docker stats -a" to display all containers.

#### Stop

```sh
docker compose down
```

This command shuts down the node, but will keep all volumes, so next time you restart the node, it won't need to synchronize from the genesis again.

#### Wipe

```sh
docker compose down -v
rm -f .env
```

These commands completely remove the node by removing all volumes used by each container.

## What's included

### Taiko Geth (L2 execution engine)

[taiko-geth](https://github.com/taikoxyz/taiko-geth) is a fork of [go-ethereum](https://github.com/ethereum/go-ethereum) with some changes according to Taiko protocol, it serves as a L2 [execution engine](https://ethereum.org/en/glossary/#execution-client), which needs to be coupled to a [consensus client](https://ethereum.org/en/glossary/#consensus-client) (in Taiko network, this will be the [taiko client](https://github.com/taikoxyz/taiko-client)'s [driver software](https://github.com/taikoxyz/taiko-client/tree/main/docs#driver)), like L1 ethereum execution engines, it will listen to new L2 transactions broadcasted in the L2 network, executes them in EVM, and holds the latest state and database of all current L2 data.

### Taiko client driver

[taiko client](https://github.com/taikoxyz/taiko-client)'s [driver software](https://github.com/taikoxyz/taiko-client/tree/main/docs#driver) serves as an L2 [consensus client](https://ethereum.org/en/glossary/#consensus-client). It will listen for new L2 blocks from the Taiko layer 1 protocol contract, then direct the connected L2 execution engine to insert them into its local chain through the [Engine API](https://github.com/ethereum/execution-apis/tree/main/src/engine).

### Taiko client proposer

[taiko client](https://github.com/taikoxyz/taiko-client)'s [proposer software](https://github.com/taikoxyz/taiko-client/tree/main/docs#proposer) will fetch pending transactions in a L2 execution engine's mempool intervally, then try to propose them to the Taiko layer 1 protocol contract.

### Prometheus and Grafana

A [Grafana](https://grafana.com/) dashboard with a [Prometheus](https://prometheus.io/) datasource is also included to display the L2 execution engine's real time status. You can visit it at <http://localhost:3000/d/L2ExecutionEngine/l2-execution-engine-overview?orgId=1&refresh=10s>.

<img width="2556" alt="image" src="https://user-images.githubusercontent.com/104078303/207779788-65d28e44-828e-491a-86a1-d8d9fc2ba81b.png">

## FAQs

### What's the system requirements?

Because we use a fork of geth, you can consult the [geth minimum requirements](https://github.com/ethereum/go-ethereum#hardware-requirements), which are outlined below.

#### Minimum:

- CPU with 2+ cores
- 4GB RAM
- 1TB free storage space to sync the Mainnet
  - (**only ~50GB for Testnet**)
- 8 MBit/sec download Internet service

#### Recommended:

- Fast CPU with 4+ cores
- 16GB+ RAM
- High-performance SSD with at least 1TB of free space
- 25+ MBit/sec download Internet service

### Why hasn't my node started proposing blocks yet?

First, check that you have updated the optional environment variables in `.env` file correctly and are using the latest docker images (you can manually update local images with `docker compose down && docker compose pull`).

Next, check the proposer image's log (`docker compose logs -f taiko_client_proposer`) to figure out what could be wrong. It's probably because:

- Your local node is still catching up with the latest chain head
- Your L1 proposer account ran out of ETH (needed to propose tx's)
- There is no available block slot to propose in the TaikoL1 smart contract, so you must wait for one to become available (you can check the protocol smart contract's status with [`TaikoL1.getStateVariables`](https://taiko.xyz/docs/smart-contracts/L1/TaikoL1#getstatevariables))

### Why am I receiving error messages?

When running a node it's normal for the node to run into errors, this doesn't mean that your node isn't working correctly. Most of the time the node resolves the errors. Some errors are there for the developers to easily debug if something goes wrong but can be ignored by users. The following table explains some error messages a bit more.

| Error message                                                                                | Explanation                                                                                             |
| -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `Proposing operation error` </br> `error="failed to propose transactions: transaction reverted`      | There are other proposers competing for the limited block space. The node will try again after a while. |
| `Unhandled trie error: missing trie node`                                                    | You can ignore this error, it doesn't affect you and goes away after a while.                                                       |
| `Block batch iterator callback error` </br> `error="failed to fetch L2 parent block: not found` | You can ignore this error.                                                                                                    |
| `Proposing operation error` </br> `error="failed to propose transactions: insufficient funds for gas * price + value"` | Your L1 wallet has ran out of funds to cover the fees. Please add funds to L1.                                                                                                 |
| `Error starting ...: listen tcp4 0.0.0.0:{port} bind: address already in use` | The port is already in use by another service. You can either shut down the other program or change the port in the .env file. |
