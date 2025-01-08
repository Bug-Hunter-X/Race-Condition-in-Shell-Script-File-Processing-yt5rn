# Shell Script Race Condition

This repository demonstrates a race condition in a shell script that processes a file.  The script checks if a file exists and then processes it, but another process might delete the file between the check and the processing, leading to an error.

## Bug

The `bug.sh` script illustrates the race condition.  It checks for a file's existence and then attempts to process it.  However, another process could remove the file in between, resulting in a `cat: /tmp/my_file.txt: No such file or directory` error.

## Solution

The `bugSolution.sh` script presents a solution using file locking.  This prevents other processes from deleting or modifying the file while it is being processed, thus eliminating the race condition.

## How to Reproduce

1. Create the `my_file.txt` file:
   ```bash
touch /tmp/my_file.txt
```
2. Run the buggy script:
   ```bash
./bug.sh
```
3. Run a second script simultaneously to delete the file after a short delay:
   ```bash
sleep 1; rm /tmp/my_file.txt
```
You'll likely observe an error in `bug.sh`.

4. Repeat steps 1-3 with `bugSolution.sh` to see that the race condition is resolved.
