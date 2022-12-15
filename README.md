# simple-taiko-node

Start your own Taiko node with one line command.

## Prerequisite

- [Docker](https://docs.docker.com/engine/install/)

## Instructions

### Clone this repository

```sh
git clone https://github.com/taikoxyz/simple-taiko-node.git
cd simple-taiko-node
```

### Configure your node

Copy `.env.sample` to `.env`, and fill the required environment variables inside.

```sh
cp .env.example .env
```

### Run the node

#### Start

```sh
docker compose up
```

This command starts the configured node, if you want to run it at background, please add the `-d` flag (`docker compose up -d`).

If this is the first time you start the node, it will synchronize from the genesis to the present, which may take some time, you can monitor this progress through logs or in local grafana dashboard(<http://localhost:3000/d/L2ExecutionEngine/l2-exectuion-engine-overview?orgId=1&refresh=10s>) and see the latest L2 chain status in [Taiko Alpha 1 L2 block explorer](https://l2explorer.a1.taiko.xyz/). (TODO: change the block explorer URL after public testnet launched)

#### Stop

```sh
docker compose down
```

This command shuts down the node, but will keep all volumes, so next time you restart the node, it won't need to synchronize from the genesis again.

#### Wipe

```sh
docker compose down -v
```

This command completely removes the node by removing all volumes used by each container.

## What's included

### Taiko Geth (L2 exectuion engine)

[taiko-geth](https://github.com/taikoxyz/taiko-geth) is a fork of [go-ethereum](https://github.com/ethereum/go-ethereum) with some changes according to Taiko protocol, it serves as a L2 [exectuion engine](https://ethereum.org/en/glossary/#execution-client), which needs to be coupled to a [consensus client](https://ethereum.org/en/glossary/#consensus-client) (in Taiko network, this will be the [taiko client](https://github.com/taikoxyz/taiko-client)'s [driver software](https://github.com/taikoxyz/taiko-client/tree/main/docs#driver)), like L1 ethereum exectuion engines，it will listen to new L2 transactions broadcasted in the L2 network, executes them in EVM, and holds the latest state and database of all current L2 data.

### Taiko client driver

[taiko client](https://github.com/taikoxyz/taiko-client)'s [driver software](https://github.com/taikoxyz/taiko-client/tree/main/docs#driver) serves as a L2 [consensus client](https://ethereum.org/en/glossary/#consensus-client). It will listen new L2 blocks from the Taiko layer 1 protocol contract, then direct the connected L2 execution engine to insert them to its local chain through [Engine API](https://github.com/ethereum/execution-apis/tree/main/src/engine).

### Taiko client proposer

[taiko client](https://github.com/taikoxyz/taiko-client)'s [proposer software](https://github.com/taikoxyz/taiko-client/tree/main/docs#proposer) will fetch pending transactions in a L2 exectuion engine's mempool intervally, then try to propose them to the Taiko layer 1 protocol contract.

### Prometheus and Grafana

A [Grafana](https://grafana.com/) dashboard with a [Prometheus](https://prometheus.io/) datasource is also included to display the L2 exectuion engine's real time status, you can visit it at <http://localhost:3000/d/L2ExecutionEngine/l2-exectuion-engine-overview?orgId=1&refresh=10s>.

<img width="2556" alt="image" src="https://user-images.githubusercontent.com/104078303/207779788-65d28e44-828e-491a-86a1-d8d9fc2ba81b.png">
