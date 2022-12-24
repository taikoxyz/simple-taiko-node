# simple-taiko-node

> Inspired by https://github.com/smartcontracts/simple-optimism-node

Start your Taiko node with a one line command.

## Prerequisite

- [Docker](https://docs.docker.com/engine/install/) is installed and running

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

To run your node as a proposer, configure the optional environment varibles in this `.env` file.

### Run the node

#### Start

```sh
docker compose up
```

This command starts the configured node. If you want to run it in the background, please add the `-d` flag (`docker compose up -d`).

If this is the first time you start the node, it will synchronize from the genesis to the present, which may take some time. You can monitor this progress through logs or in the local grafana dashboard and see the latest L2 chain status in [Taiko Alpha-1 L2 block explorer](https://l2explorer.a1.taiko.xyz/).

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
