#!/bin/bash

# Function to transfer funds and set up operator
# Usage: setup_operator "0x1234..." "0x5678..." "0x9abc..."
# Args: $1 = operator_address, $2 = operator_private_key, $3 = contract_owner_private_key
setup_operator() {
  local OPERATOR_ADDRESS="$1"
  local OPERATOR_PRIVATE_KEY="$2"
  local CONTRACT_OWNER_PRIVATE_KEY="$3"

  if [ -z "$OPERATOR_ADDRESS" ]; then
    echo "Error: Operator address is required"
    return 1
  fi

  if [ -z "$OPERATOR_PRIVATE_KEY" ]; then
    echo "Error: Operator private key is required"
    return 1
  fi

  if [ -z "$CONTRACT_OWNER_PRIVATE_KEY" ]; then
    echo "Error: Contract owner private key is required"
    return 1
  fi

  echo
  echo "Setting up operator: $OPERATOR_ADDRESS"

  # Check and transfer TAIKO tokens if needed
  OPERATOR_TOKENS=$(cast call $TAIKO_TOKEN "balanceOf(address)(uint256)" $OPERATOR_ADDRESS --rpc-url $L1_ENDPOINT_WS | cut -d' ' -f1)
  echo "Operator balance: $OPERATOR_TOKENS"
  if [ $((OPERATOR_TOKENS)) -eq 0 ]; then
    cast send $TAIKO_TOKEN "transfer(address,uint256)" $OPERATOR_ADDRESS 10000000000000000000000000 --rpc-url $L1_ENDPOINT_WS --private-key $CONTRACT_OWNER_PRIVATE_KEY
    echo "Operator balance after transfer: $(cast call $TAIKO_TOKEN "balanceOf(address)(uint256)" $OPERATOR_ADDRESS --rpc-url $L1_ENDPOINT_WS)"
  fi

  # Check operator ETH balance
  OPERATOR_L1_ETH_BALANCE=$(cast balance --rpc-url $L1_ENDPOINT_WS $OPERATOR_ADDRESS)
  echo "Operator L1 ETH balance: $OPERATOR_L1_ETH_BALANCE"

  if [ $((OPERATOR_L1_ETH_BALANCE)) -eq 0 ]; then
    cast send $OPERATOR_ADDRESS --value 1000ether --rpc-url $L1_ENDPOINT_WS --private-key $CONTRACT_OWNER_PRIVATE_KEY
    echo "Operator L1 ETH balance after transfer: $(cast balance --rpc-url $L1_ENDPOINT_WS $OPERATOR_ADDRESS)"
  fi

  # Check and set allowance if needed
  OPERATOR_ALLOWANCE=$(cast call $TAIKO_TOKEN "allowance(address,address)(uint256)" $OPERATOR_ADDRESS $TAIKO_INBOX --rpc-url $L1_ENDPOINT_WS | cut -d' ' -f1)
  echo "Operator allowance: $OPERATOR_ALLOWANCE"
  if [ $((OPERATOR_ALLOWANCE)) -eq 0 ]; then
    cast send $TAIKO_TOKEN "approve(address,uint256)" $TAIKO_INBOX 10000000000000000000000000 --rpc-url $L1_ENDPOINT_WS --private-key $OPERATOR_PRIVATE_KEY
    echo "Operator allowance after approval: $(cast call $TAIKO_TOKEN "allowance(address,address)(uint256)" $OPERATOR_ADDRESS $TAIKO_INBOX --rpc-url $L1_ENDPOINT_WS)"
  fi

  echo
  echo "Operator setup completed for: $OPERATOR_ADDRESS"
}

echo Taiko inbox: $TAIKO_INBOX

OPERATOR_ADDRESS_1=$(cast wallet address --private-key $OPERATOR_1_PRIVATE_KEY)
echo Operator 1 address: $OPERATOR_ADDRESS_1
OPERATOR_ADDRESS_2=$(cast wallet address --private-key $OPERATOR_2_PRIVATE_KEY)
echo Operator 2 address: $OPERATOR_ADDRESS_2


TAIKO_FUNDS_ADDRESS=$(cast wallet address --private-key $CONTRACT_OWNER_PRIVATE_KEY)
echo Taiko balance: $(cast call $TAIKO_TOKEN "balanceOf(address)(uint256)" $TAIKO_FUNDS_ADDRESS --rpc-url $L1_ENDPOINT_WS)

# Call the setup_operator function
setup_operator "$OPERATOR_ADDRESS_1" "$OPERATOR_1_PRIVATE_KEY" "$CONTRACT_OWNER_PRIVATE_KEY"
# setup_operator "$OPERATOR_ADDRESS_2" "$OPERATOR_2_PRIVATE_KEY" "$CONTRACT_OWNER_PRIVATE_KEY"

OPERATOR_COUNT=$(cast call $PRECONFIRMATION_WHITELIST "operatorCount()" --rpc-url $L1_ENDPOINT_WS)
echo Number of operators: $OPERATOR_COUNT
if [ $((OPERATOR_COUNT)) -lt 2 ]; then
    OPERATOR_CHANGE_DELAY=0
    echo
    echo "Setting operator change delay to $OPERATOR_CHANGE_DELAY"
    cast send $PRECONFIRMATION_WHITELIST "setOperatorChangeDelay(uint8)" $OPERATOR_CHANGE_DELAY --rpc-url $L1_ENDPOINT_WS --private-key $CONTRACT_OWNER_PRIVATE_KEY

    echo
    echo "Adding operator to whitelist using preconfirmation whitelist address $PRECONFIRMATION_WHITELIST"
    cast send $PRECONFIRMATION_WHITELIST "addOperator(address, address)" $OPERATOR_ADDRESS_1 $OPERATOR_ADDRESS_1 --rpc-url $L1_ENDPOINT_WS --private-key $CONTRACT_OWNER_PRIVATE_KEY
    cast send $PRECONFIRMATION_WHITELIST "addOperator(address, address)" $OPERATOR_ADDRESS_2 $OPERATOR_ADDRESS_2 --rpc-url $L1_ENDPOINT_WS --private-key $CONTRACT_OWNER_PRIVATE_KEY

    echo "Removing default operator"
    cast send $PRECONFIRMATION_WHITELIST "removeOperator(address, bool)" 0x8943545177806ED17B9F23F0a21ee5948eCaa776 true --rpc-url $L1_ENDPOINT_WS --private-key $CONTRACT_OWNER_PRIVATE_KEY

    echo
    echo "Checking number of operators again"
    OPERATOR_COUNT=$(cast call $PRECONFIRMATION_WHITELIST "operatorCount()" --rpc-url $L1_ENDPOINT_WS)
    echo Number of operators: $OPERATOR_COUNT
fi