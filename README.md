# simple-taiko-node

Get started with the [guide](https://docs.taiko.xyz/guides/node-operators/run-a-taiko-node-with-docker/).

## Setup Instructions

1. Copy the appropriate .env sample file:
   ```bash
   # For regular setup
   cp .env.sample .env

   # For Hekla testnet
   cp .env.sample.hekla .env
   ```

2. Configure the required L1 endpoints in your `.env` file:
   ```env
   # L1 endpoints (required)
   L1_ENDPOINT_HTTP=        # Your L1 HTTP endpoint
   L1_ENDPOINT_WS=         # Your L1 WebSocket endpoint
   L1_BEACON_HTTP=         # Your L1 Beacon node HTTP endpoint
   ```

   For the L1 Beacon endpoint:
   - Local node example: `http://host.docker.internal:5052`
   - Remote node example: `http://82.168.1.15:5052`

3. Choose your L2 execution engine in the `.env` file:

   **Taiko-Geth**
   ```env
   L2_EXECUTION_ENGINE=taiko-geth
   L2_EXECUTION_ENGINE_IMAGE=us-docker.pkg.dev/evmchain/images/taiko-geth:v1.11.1
   ```

   **Nethermind**
   ```env
   L2_EXECUTION_ENGINE=nethermind
   L2_EXECUTION_ENGINE_IMAGE=nethermind/nethermind:1.30.1
   ```

4. Start the node with docker-compose:
   ```bash
   # For regular setup
   docker compose up

   # For Hekla testnet
   docker compose -f docker-compose-hekla.yml up
   ```

## Important Notes

- The docker-compose configuration is unified for both execution engines
- The JWT secret for the execution engine is automatically managed by a dedicated initialization service
- The L1 beacon node endpoint should be configured with the correct protocol (http/https) and port
- All required endpoints must be properly configured in the `.env` file before starting the node
