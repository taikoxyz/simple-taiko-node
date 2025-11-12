"use strict";
const ethers = require("ethers");
const { sleep } = require("./wait");
const inboxABI = require("./abis/DevnetInbox.json").abi;

const POLL_INTERVAL_MS = 5000;

async function initShastaGenesis(shastaInboxAddress, signer, provider, shastaForkTime) {
    if (!shastaInboxAddress) {
        throw new Error("Missing inbox addresses for Shasta genesis initialization");
    }
    const inbox = new ethers.Contract(shastaInboxAddress, inboxABI, signer);
    const forkTime = BigInt(shastaForkTime);
    console.log(`[initShastaGenesis] target shasta fork time: ${forkTime.toString()}`);

    const owner = await inbox.owner();
    console.log(`[initShastaGenesis] inbox owner: ${owner}`);

    while (true) {
        const currentHeight = await provider.getBlockNumber();
        const block = await provider.getBlock(currentHeight);
        const l1Block = await signer.provider.getBlock("latest");

        if (!block || !block.hash) {
            console.log(`[initShastaGenesis] latest block ${currentHeight} not yet available, retrying`);
            await sleep(POLL_INTERVAL_MS);
            continue;
        }

        const blockTimestamp = BigInt(l1Block.timestamp);
        console.log(
            `[initShastaGenesis] current height: block timestamp: ${blockTimestamp.toString()}, fork time: ${forkTime.toString()}`
        );

        if (blockTimestamp < forkTime) {
            console.log(`[initShastaGenesis] current block timestamp ${blockTimestamp.toString()} is less than fork time ${forkTime.toString()}, retrying`);
            await sleep(POLL_INTERVAL_MS);
            continue;
        }

        console.log(
            `[initShastaGenesis] invoking activate with owner ${owner} at block ${currentHeight} (timestamp ${blockTimestamp.toString()})`
        );

        const tx = await inbox.activate(block.hash);
        console.log(`[initShastaGenesis] activate submitted, tx hash: ${tx.hash}`);

        await tx.wait();
        console.log("[initShastaGenesis] activate confirmed");
        break;
    }
}

module.exports = {
    initShastaGenesis,
};