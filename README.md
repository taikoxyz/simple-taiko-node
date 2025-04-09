# simple-surge-node

`simple-surge-node` is a lightweight tool for setting up and managing a node on the Surge network. **This repository is intended for development purposes only and is not recommended for production use.**

This repository is ideal for easy set up operating Layer 2 (L2) solutions, simplifying the process of running Surge node.

Get started with the [guide](https://docs.surge.wtf/docs/Guides/running-surge) or explore [deploying L2](https://docs.surge.wtf/docs/guides/running-surge/deploy-l2).

## How to Use

> **Note:** This "How to Use" section assumes that you have already completed the **Deploying L1** step from the [full guide](https://docs.surge.wtf/docs/guides/running-surge/deploy-l1).

### 1. Configure Environment

Create your environment configuration file (`.env`) by copying the provided sample:

```bash
# for devnet
cp .env.devnet .env
# for hoodi
cp .env.hoodi .env
```

> **Tip:** The `.env.devnet` file includes default values devnet configuration. You can customize these values, such as L1 and L2 settings, genesis hashes, and addresses, as needed.

> **Note:** `host.docker.internal` values in the `.env` file might not work in all environments. If you encounter issues, replace `host.docker.internal` with your server's IP address or hostname.

### 2. Start Components

Deploying L2 involves sequentially starting five components. Ensure you follow the correct order for proper communication between them.

**Component Order:**

1. **Driver**: Manages network execution via Nethermind Execution Client.
2. **Proposer**: Handles transaction bundling and block proposals.
3. **Prover Relayer**: Relays proofs received from provers.
4. **Metrics**: Monitors network performance using Prometheus and Grafana.
5. **BlockScout**: Provides blockchain exploration and monitoring interface.

> **Note:** If you did not deploy a prover in the setup steps, provided by [full guide](https://docs.surge.wtf/docs/guides/running-surge/provers), you can safely skip launching the prover relayer.

#### Commands to Start Components:

- **Driver**: Starts the Nethermind Execution Client for L2 network operation:
  ```bash
  docker compose --profile nethermind_execution_l2 up -d
  ```

- **Proposer**: Initiates the Proposer service for transaction bundling and block proposals:
  ```bash
  docker compose --profile proposer up -d
  ```

- **Prover Relayer**: Launches the Prover Relayer for proof relay:
  ```bash
  docker compose --profile prover up -d
  ```

- **Metrics**: Sets up Prometheus and Grafana for real-time monitoring:
  ```bash
  docker compose --profile metrics up -d
  ```

- **BlockScout**: Launches BlockScout for blockchain exploration and monitoring:
  ```bash
  docker compose --profile blockscout up -d
  ```

### 3. Verification

After deploying all components, ensure everything is running correctly by:

- Checking the status of Docker containers using:
  ```bash
  docker compose ps
  ```
- Monitoring logs for startup errors with:
  ```bash
  docker compose --profile <profile_name> logs -f --tail 100
  ```
- Verifying network connectivity between components.
- Accessing BlockScout for L1 and L2 chain exploration and verification:
  - **L1 BlockScout:** [http://localhost:35003](http://localhost:35003)
  - **L2 BlockScout:** [http://localhost:4000](http://localhost:4000)

> **Note:** Depending on your deployment setup, you might need to replace `localhost` with your server's IP address, hostname, or appropriate domain.

### 4. Troubleshooting

If issues arise during deployment:

- Confirm environment variables in `.env` are correctly configured.
- Review Docker logs for detailed error information.
- Ensure required ports are open and accessible.
- Check network connectivity between the deployed components.
