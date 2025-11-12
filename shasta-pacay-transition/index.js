"use strict";

// Load environment variables from .env file
require('dotenv').config();

const { initShastaGenesis } = require("./monitor_for_transition");
const { ethers } = require("ethers");

// Configuration from environment variables
const RPC_URL = process.env.L1_ENDPOINT_HTTP;
const PRIVATE_KEY = process.env.CONTRACT_OWNER_PRIVATE_KEY;
const L2_RPC_URL = process.env.L2_RPC_URL;
const SHASTA_INBOX_ADDRESS = process.env.SHASTA_INBOX;
const SHASTA_TIMESTAMP = process.env.TAIKO_INTERNAL_SHASTA_TIME;

async function main() {
    try {
        console.log("Starting Shasta to Pacay transition monitoring...");

        // Validate required environment variables
        if (!RPC_URL || !PRIVATE_KEY) {
            throw new Error("Missing required environment variables. Please check your .env file.");
        }

        console.log("Relevant environment variables:");
        console.log(`L1_ENDPOINT_HTTP=${RPC_URL}`);
        console.log(`L2_RPC_URL=${L2_RPC_URL}`);
        console.log(`SHASTA_INBOX=${SHASTA_INBOX_ADDRESS}`);
        console.log(`TAIKO_INTERNAL_SHASTA_TIME=${SHASTA_TIMESTAMP}`);

        // Create provider and signer
        const provider = new ethers.JsonRpcProvider(RPC_URL);
        const signer = new ethers.Wallet(PRIVATE_KEY, provider);
        const l2_provider = new ethers.JsonRpcProvider(L2_RPC_URL);

        console.log(`Connected to network: ${await provider.getNetwork()}`);
        console.log(`Signer address: ${await signer.getAddress()}`);

        // Initialize Shasta genesis
        await initShastaGenesis(SHASTA_INBOX_ADDRESS, signer, l2_provider, SHASTA_TIMESTAMP);

        console.log("Transition monitoring completed successfully!");

    } catch (error) {
        console.error("Error during transition monitoring:", error);
        process.exit(1);
    }
}

// Run the main function
if (require.main === module) {
    main();
}

module.exports = { main };
