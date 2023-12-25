address= ${L2_SUGGESTED_FEE_RECIPIENT}

# Remove '0x' and convert to lowercase
address=$(echo "$address" | sed 's/^0x//;s/.\{1,\}/\L&/')


hash=$(echo -n "$address" | echo -n -e "\x$address" | openssl dgst -sha3-256 -binary | xxd -p)

checksum="0x"

for ((i=0; i<${#address}; i++)); do
  char="${address:$i:1}"
  hash_char="${hash:$i:1}"

  # Convert to uppercase if the corresponding hash character is greater than or equal to 8
  if (( 0x$hash_char >= 8 )); then
    checksum+=$(echo "$char" | tr '[:lower:]' '[:upper:]')
  else
    checksum+="$char"
  fi
done

echo "$checksum"
