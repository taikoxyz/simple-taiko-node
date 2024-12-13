# simple-taiko-node

Get started with the [guide](https://docs.taiko.xyz/guides/node-operators/run-a-taiko-node-with-docker/).

## Execution Engine Options

This repository supports two L2 execution engine options:

1. **Taiko-Geth (Default)**
   - Use the default `docker-compose.yml` and `.env.sample`
   - Command: `docker compose up`

2. **Nethermind**
   - Use `docker-compose-nethermind.yml` and `.env.sample.nethermind`
   - Command: `docker compose -f docker-compose-nethermind.yml up`

For Hekla testnet:
- Taiko-Geth: Use `docker-compose-hekla.yml`
- Nethermind: Use `docker-compose-nethermind-hekla.yml`

## Configuration

1. Copy the appropriate .env sample file:
   ```bash
   # For Taiko-Geth
   cp .env.sample .env

   # For Nethermind
   cp .env.sample.nethermind .env
   ```

2. Configure your environment variables in the `.env` file.

3. Start the node with the appropriate docker-compose file for your chosen execution engine.
