#!/bin/bash

# This script attempts to process a file, but it has a race condition.
# It checks if a file exists, and if so, it processes it. However, another process might
# delete the file after the check but before the processing starts.

file_to_process="/tmp/my_file.txt"

if [ -f "$file_to_process" ]; then
  echo "File exists. Processing..."
  # Simulate some processing time
sleep 2
  # The file might be deleted between the check and this point
  cat "$file_to_process"
else
  echo "File does not exist."
fi