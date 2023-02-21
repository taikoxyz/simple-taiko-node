#!/bin/sh
#
# Tool to help the user set up the .env file instead of having to do it manually
# Can update the .env to be a standard node or proposer
# Assumes there is a .env.sample ; if a .env file exists it will offer to backup
#

set -e

update_env(){
    SEARCHPHRASE=$1
    REPLACEMENTVAR=$2
    FILENAME=$3
    
    oldline=$(sed -n -e "/^${SEARCHPHRASE}/{p}" $FILENAME)
    if [ -n "$( echo $oldline | sed -n '/#/p')" ]; then
        comment=$(echo $oldline | sed "s/^[^#]*#//")
        newline=$(echo $SEARCHPHRASE$REPLACEMENTVAR "#"$comment)
    else
        newline=$(echo $SEARCHPHRASE$REPLACEMENTVAR)
    fi

    sed -i "s/$oldline/$newline/" $FILENAME
}

# Variables
run_a_node_guide="https://taiko.xyz/docs/testnet-guide/run-a-node"
varname_enable_proposer="ENABLE_PROPOSER="
varname_private_key="L1_PROPOSER_PRIVATE_KEY="
varname_l2_address="L2_SUGGESTED_FEE_RECIPIENT="

echo
echo "-----------------------------------------------------------"
echo "               Welcome to the Taiko Testnet                "
echo "-----------------------------------------------------------"
echo
echo "This configuration tool sets up the .env for the Taiko Node"
echo "You can run the Taiko node as either a standard node, or a propser"
echo "-----------------------------------------------------------"
echo "If you are setting the node up as a proposer, you will need:"
echo "  1) your wallet's private key"
echo "  2) layer 2 address you want to receive the tx fees from the block"
echo "-----------------------------------------------------------"
echo "Please refer to Run a Taiko Node Guide for additional help"
echo "$run_a_node_guide"
echo "-----------------------------------------------------------"
echo

# Start config tool
while true; do
    read -p 'Would you like to begin? (yes/no): ' begin_yesno
    begin_yesno="$(echo "$begin_yesno" | tr -dc '[:alnum:]' | tr '[:upper:]' '[:lower:]')"
    if [ "$begin_yesno" = "yes" ]; then
        break
    elif [ "$begin_yesno" = "no" ]; then
        echo "Exiting configuration tool, no changes were made."
        exit
    else
        echo
        echo "Please type either 'yes' or 'no'"
        echo "-> 'yes' will proceed with the configuration"
        echo "-> 'no' will exit the configuation"
    fi
done
echo

# Check if .env.sample exists, if not then exit program
if [ ! -f .env.sample ]; then
    echo "There is no .sample.env file, please reference the Run a Taiko node guide"
    echo "$run_a_node_guide"
    echo "Exiting configuration tool, no changes were made."
    exit
fi

# create the .env file, if one alredy exists offer to back up
if [ ! -f .env ]; then
    cp .env.sample .env
    echo "This is the first time running the configuration and have created the .env file"
else
    echo "There already exists a (.env) configuration file"
    while true; do
        read -p 'Would you like to backup the current configuration file (.env) before proceeding? (yes/no/exit): ' backup_yesnoexit
        backup_yesnoexit="$(echo "$backup_yesnoexit" | tr -dc '[:alnum:]' | tr '[:upper:]' '[:lower:]')"
        if [ "$backup_yesnoexit" = "yes" ]; then
            backup_name=".env.backup.`date +%s`"
            echo "The previous configuration was backed up to:" $backup_name
            cp .env $backup_name
            rm -f .env
            cp .env.sample .env
            break 
        elif [ "$backup_yesnoexit" = "no" ]; then
            echo "You completed setting up a standard Node"
            cp .env.sample .env
            break
        elif [ "$backup_yesnoexit" = "exit" ]; then
            echo "Exiting configuration tool, no changes were made."
            exit
        else
            echo ;
            echo "Please type either 'yes' , 'no' or 'exit'."
            echo "-> 'yes' will backup current configuration before proceeding"
            echo "-> 'no' will proceed with backup"
            echo "-> 'exit' with exit the configuation tool"
        fi
    done
fi
echo

# Set up the proposer node
while true; do
    read -p 'Do you want run the node as a proposer? (yes/no): ' proposer_yesno
    proposer_yesno="$(echo "$proposer_yesno" | tr -dc '[:alnum:]' | tr '[:upper:]' '[:lower:]')"
    if [ "$proposer_yesno" = "yes" ]; then
        echo "Please enter your wallet's private key"
        read -p "private key: " user_private_key
        user_private_key="$(echo "$user_private_key" | tr -dc '[:alnum:]')"
        echo
        echo "Please enter your layer 2 address you want "
        read -p "layer 2 address : " user_l2_address
        user_l2_address="$(echo "$user_l2_address" | tr -dc '[:alnum:]')"
        echo
        
        update_env $varname_enable_proposer "true" ".env"
        update_env $varname_private_key "$user_private_key" ".env"
        update_env $varname_l2_address "$user_l2_address" ".env"
        
        echo "The node has been set up as a propser node"
        echo "If any information needs to be updated, please rerun the configuration tool"
        
        break
    elif [ "$proposer_yesno" = "no" ]; then
        echo "The node has been set up as a standard node"
        echo "If any information needs to be updated, please rerun the configuration tool"
        break
    else
        echo "Please type either 'yes' or 'no'. 'yes' will proceed with the configuring the Propser, 'no' will exit the configuation"
    fi
done

