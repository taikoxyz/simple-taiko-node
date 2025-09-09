#!/bin/bash

# Parse command line arguments
PRIVATE_KEY_ARG=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --private-key)
      PRIVATE_KEY_ARG="$2"
      shift 2
      ;;
    --help|-h)
      echo "Usage: $0 [--private-key PRIVATE_KEY]"
      echo "  --private-key PRIVATE_KEY  Private key to use for transactions"
      echo "  --help, -h                 Show this help message"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Use --help for usage information"
      exit 1
      ;;
  esac
done

echo Taiko inbox: $TAIKO_INBOX

# Use command line argument if provided, otherwise use environment variable
if [ -n "$PRIVATE_KEY_ARG" ]; then
  OPERATOR_PRIVATE_KEY="$PRIVATE_KEY_ARG"
fi
OPERATOR_ADDRESS=$(cast wallet address --private-key $OPERATOR_PRIVATE_KEY)
echo Operator address: $OPERATOR_ADDRESS


TAIKO_FUNDS_ADDRESS=$(cast wallet address --private-key $CONTRACT_OWNER_PRIVATE_KEY)

echo Taiko balance: $(cast call $TAIKO_TOKEN "balanceOf(address)(uint256)" $TAIKO_FUNDS_ADDRESS --rpc-url $L1_ENDPOINT_WS)


OPERATOR_TOKENS=$(cast call $TAIKO_TOKEN "balanceOf(address)(uint256)" $OPERATOR_ADDRESS --rpc-url $L1_ENDPOINT_WS | cut -d' ' -f1)
echo Operator balance: $OPERATOR_TOKENS
if [ $((OPERATOR_TOKENS)) -eq 0 ]; then
  cast send $TAIKO_TOKEN "transfer(address,uint256)" $OPERATOR_ADDRESS 10000000000000000000000000 --rpc-url $L1_ENDPOINT_WS --private-key $CONTRACT_OWNER_PRIVATE_KEY
  echo Operator balance after transfer: $(cast call $TAIKO_TOKEN "balanceOf(address)(uint256)" $OPERATOR_ADDRESS --rpc-url $L1_ENDPOINT_WS)
fi

## Operator ETHs
echo Operator L1 ETH balance: $(cast balance --rpc-url $L1_ENDPOINT_WS $OPERATOR_ADDRESS)

OPERATOR_ALLOWANCE=$(cast call $TAIKO_TOKEN "allowance(address,address)(uint256)" $OPERATOR_ADDRESS $TAIKO_INBOX --rpc-url $L1_ENDPOINT_WS | cut -d' ' -f1)
echo Operator allowance: $OPERATOR_ALLOWANCE
if [ $((OPERATOR_ALLOWANCE)) -eq 0 ]; then
  cast send $TAIKO_TOKEN "approve(address,uint256)" $TAIKO_INBOX 10000000000000000000000000 --rpc-url $L1_ENDPOINT_WS --private-key $OPERATOR_PRIVATE_KEY
  echo Operator allowance after approval: $(cast call $TAIKO_TOKEN "allowance(address,address)(uint256)" $OPERATOR_ADDRESS $TAIKO_INBOX --rpc-url $L1_ENDPOINT_WS)
fi

OPERATOR_COUNT=$(cast call $PRECONFIRMATION_WHITELIST "operatorCount()" --rpc-url $L1_ENDPOINT_WS)
echo Number of operators: $OPERATOR_COUNT
if [ $((OPERATOR_COUNT)) -eq 0 ]; then
    OPERATOR_CHANGE_DELAY=0
    echo Setting operator change delay to $OPERATOR_CHANGE_DELAY
    cast send $PRECONFIRMATION_WHITELIST "setOperatorChangeDelay(uint8)" $OPERATOR_CHANGE_DELAY --rpc-url $L1_ENDPOINT_WS --private-key $CONTRACT_OWNER_PRIVATE_KEY

    echo Adding operator to whitelist using preconfirmation whitelist address $PRECONFIRMATION_WHITELIST
    cast send $PRECONFIRMATION_WHITELIST "addOperator(address, address)" $OPERATOR_ADDRESS $OPERATOR_ADDRESS $PRECONFIRMATION_WHITELIST --rpc-url $L1_ENDPOINT_WS --private-key $CONTRACT_OWNER_PRIVATE_KEY
fi