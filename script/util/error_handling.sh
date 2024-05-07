# error_handling.sh
#!/bin/sh

# Function to handle errors and exit
handle_error() {
  echo "[$(date +"%Y-%m-%dT%H:%M:%S")] ERROR: $*" >&2  # Log error to stderr
  exit 1
}
