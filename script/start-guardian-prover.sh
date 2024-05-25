#!/bin/sh

set -eou pipefail

taiko-client prover \
    --l1.ws ${L1_ENDPOINT_WS} \
    --l2.ws ws://l2_execution_engine:8546 \
    --l1.http ${L1_ENDPOINT_HTTP} \
    --l2.http http://l2_execution_engine:8545 \
    --prover.guardianProverHealthCheckServerEndpoint https://guardian-prover-health-check.katla.taiko.xyz  \
    --taikoL1 ${TAIKO_L1_ADDRESS} \
    --taikoL2 ${TAIKO_L2_ADDRESS} \
    --taikoToken ${TAIKO_TOKEN_L1_ADDRESS} \
    --assignmentHook ${ASSIGNMENT_HOOK_L1_ADDRESS} \
    --guardianProver ${GUARDIAN_PROVER_L1_ADDRESS} \
    --l1.proverPrivKey ${L1_PROVER_PRIVATE_KEY} \
    --prover.capacity 1024 \
    --db.path /data \
    --prover.proveUnassignedBlocks \
    --mode.contester
