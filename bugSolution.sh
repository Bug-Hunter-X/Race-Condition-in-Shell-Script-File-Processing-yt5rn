#!/bin/bash

# This script uses flock to prevent a race condition.
# It acquires an exclusive lock on the file before processing it,
# ensuring that no other process can delete or modify the file
# while it's being processed.

file_to_process="/tmp/my_file.txt"

# Try to acquire an exclusive lock on the file
flock "$file_to_process" || exit 1

if [ -f "$file_to_process" ]; then
  echo "File exists. Processing..."
  # Simulate some processing time
sleep 2
  # Now it is safe to process the file because we have an exclusive lock
  cat "$file_to_process"
else
  echo "File does not exist."
fi

# Release the lock
flock -u "$file_to_process"