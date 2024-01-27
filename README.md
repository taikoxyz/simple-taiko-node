# Simple Taiko Node

This guide is the same [guide](https://docs.taiko.xyz/guides/run-a-taiko-node) provided in our website. You can use both.

# Run a Taiko Node

This guide will help you start up a Taiko RPC node using simple-taiko-node.

>**Note:** For now, you can run a **plain RPC node** which is mainly useful for fun / development purposes. There is some information below on starting an SGX / ZK-EVM prover, but the docs are a work in progress 🚧. Stay tuned for updates!

## Prerequisites

Before you begin, ensure you have the following prerequisites installed:

- [Docker](https://docs.docker.com/engine/install/): Installed and running.
- [Git](https://github.com/git-guides/install-git/): Installed.
- For Windows users: Install [Git BASH](https://gitforwindows.org/) or [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) as your terminal. 

Meet the [Geth minimum hardware requirements](https://github.com/ethereum/go-ethereum#hardware-requirements), except for the storage requirement, as Taiko nodes require less storage.

## Run a Taiko Node

1. **Clone simple-taiko-node:**

    Mac/Linux:

    ```bash
    git clone https://github.com/taikoxyz/simple-taiko-node.git
    cd simple-taiko-node
    ```

    Windows:

    ```bash
    git clone https://github.com/taikoxyz/simple-taiko-node.git
    cd simple-taiko-node && git config core.autocrlf false
    ```

2. **Copy the sample .env files:**

    ```bash
    cp .env.sample .env
    ```

3. **Set the L1 archive node endpoint:**

    Open the `.env` file in your preferred text editor:

    Mac/Linux:

    ```bash
    nano .env
    ```

    Windows:

    ```bash
    notepad .env
    ```

    Next, you will set the L1 archive node endpoints.

    > **Note:** You can use any Holesky L1 endpoint, but it must point to an archive node to access the state trie beyond the last 128 blocks.
    > It’s recommended to [run a local Holesky node](https://docs.taiko.xyz/guides/run-a-holesky-node), but you can explore other [Holesky RPC providers](https://chainlist.org/chain/17000). Keep in mind they will **eventually rate limit your node**, and it will stop syncing, so a local L1 node is recommended for a proper setup.

    If you are running a local Holesky node, you cannot reference the L1 endpoints as `http://127.0.0.1:8545` and `ws://127.0.0.1:8546` because that is local to inside the simple-taiko-node Docker image. Depending on your firewall setup, you can do a few things. You can try:

    - Using `host.docker.internal` (see: [Stack Overflow](https://stackoverflow.com/questions/48546124/how-to-access-host-port-from-docker-container-using-ip-address))
    - Using the private IP address of your machine (use something like `ip addr show` to get this IP address)

    After getting the address of the Holesky archive node, set the following L1 node endpoints in your `.env` file:

    - `L1_ENDPOINT_HTTP`
    - `L1_ENDPOINT_WS`

    Take a look at the comments above these values in the `.env.sample` to see how to set them up.


4. **Start the node:**

    > **Note:** If you ran a testnet node previously, run `docker compose down -v` to remove old volumes.

    Ensure Docker is running, then execute the following command to start the node:

        docker compose up -d


## Verify Node is Running

**Option 1: Check with the node dashboard**

A node dashboard will be running on `localhost` on the `GRAFANA_PORT` you set in your `.env` file, which defaults to `3001`: [http://localhost:3001/d/L2ExecutionEngine/l2-execution-engine-overview](http://localhost:3001/d/L2ExecutionEngine/l2-execution-engine-overview).

You can verify that your node is syncing by checking that the **chain head** on the dashboard is increasing. Once the chain head matches what’s on the block explorer, you are fully synced.

**Option 2: Check with curl commands**

1. Check if the Execution Layer client is connected to Taiko L2:

    ```bash
    curl http://localhost:8547 \
      -X POST \
      -H "Content-Type: application/json" \
      --data '{"method":"eth_chainId","params":[],"id":1,"jsonrpc":"2.0"}'
    ```

    Verify the chainId response is `0x28c60` (167008):

   `{ "jsonrpc": "2.0", "id": 1, "result": "0x28c60" }`

2. Check if the Execution Layer client is synced by requesting the latest Taiko L2 / L3 block from the Execution Layer client:

    ```bash
    curl http://localhost:8547 \
      -X POST \
      -H "Content-Type: application/json" \
      --data '{"method":"eth_blockNumber","params":[],"id":1,"jsonrpc":"2.0"}'
    ```

3. If the blockNumber response value is `0` or not growing, check the Taiko L2 logs here:

    ```bash
    docker compose logs -f
    ```

> **Note:** You may need to use `sudo docker compose logs -f` if you are not in the `docker` group.

### Video Tutorial

See the video tutorial [Run a Taiko L2 node (YouTube)](https://www.youtube.com/watch?v=l_tVvDcuK5o). It’s for a previous testnet but the overall steps are the same!

## Enable a Proposer

To enable a proposer, follow these steps:

1. First, you will need to have a prover from the marketplace. This prover must be able to generate SGX and ZK-EVM proofs (for now, but will later plan to de-couple these proof markets). This is because it’s unknown at the time of block proposal if the prover which provides the bond will need to generate an SGX or ZK proof. See the current tier configuration [here](https://docs.taiko.xyz/network-reference/network-configuration).
2. Then you can set `PROVER_ENDPOINTS` in simple-taiko-node `.env` file to the prover’s endpoint.
3. Next, set the `L1_PROPOSER_PRIVATE_KEY` to an L1 account’s private key which will send the Propose Block transactions.
4. Finally set `ENABLE_PROPOSER` to true in simple-taiko-node `.env`.

## Enable an SGX Prover

1. Follow the guide here:
    - Raiko docker tutorial: [https://github.com/johntaiko/zeth/blob/feat/taiko/README_Docker.md](https://github.com/johntaiko/zeth/blob/feat/taiko/README_Docker.md)
    - See docker compose config here: [https://github.com/johntaiko/zeth/blob/feat/taiko/docker/docker-compose-pos.yml](https://github.com/johntaiko/zeth/blob/feat/taiko/docker/docker-compose-pos.yml)
    - Note: Running docker with `--init` will do the bootstrap: [https://github.com/johntaiko/zeth/blob/feat/taiko/docker/entrypoint.sh](https://github.com/johntaiko/zeth/blob/feat/taiko/docker/entrypoint.sh)
2. Submit your public key to the form: [https://forms.gle/qquRq3cnGbyneV9S6](https://forms.gle/qquRq3cnGbyneV9S6). 

    **Please do not spam submit to this form**. We do not expect too many folks to have SGX provers and that’s okay! Only submit after you have generated your key pair with your SGX machine. After submitting we will manually register the public key and send you the necessary TTKOk.

## Enable a ZK-EVM Prover

-  Check the `.env` in **simple-taiko-node** and edit variables accordingly to start a prover.

## Full simple-taiko-node CLI Reference

### Start node: 
```bash
docker compose up -d
```
### Stop node: 
```bash
docker compose down
```
### Restart node: 
```bash
docker compose down && docker compose up -d
```
### Update node: 
```bash
git pull origin main && docker compose pull
```
### Remove node: 
```bash
docker compose down -v
```
### Start and remove orphan containers:
This command will start and remove containers that are not part of the current docker compose file.
```bash
 docker compose up -d --remove-orphans
 ```

## View Logs and Dashboards

### View Grafana dashboard: 
```bash
open http://localhost:3001/d/L2ExecutionEngine/l2-execution-engine-overview
```
### View all logs: 
```bash
docker compose logs -f
```
### View execution logs: 
```bash
docker compose logs -f l2_execution_engine
```
### View client driver logs: 
```bash
docker compose logs -f taiko_client_driver
```
### View client proposer logs: 
```bash
docker compose logs -f taiko_client_proposer
```
### View client prover relayer logs: 
```bash
docker compose logs -f taiko_client_prover_relayer
```
### View ZK-EVM prover logs: 
```bash
docker compose logs -f zkevm_chain_prover_rpcd
```
### View system resource usage stats: 
```bash
docker stats
```
### Compare .env and .env.sample: 
```bash
sdiff .env .env.sample
```
## Troubleshooting

- Visit the [Discord](https://discord.gg/taikoxyz) for help on any common error codes/issues.
- View the logs of the node (see above).