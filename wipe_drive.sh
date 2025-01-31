#!/bin/bash

if [ -z "$1" ]; then
    echo "Please input a path to wipe. Example: $0 /dev/sdb"
    exit 1
fi

DEVICE="$1"

read -p "WARNING: This will erase all data on $DEVICE. Type 'YES' to proceed: " CONFIRM
if [ "$CONFIRM" != "YES" ]; then
    echo "Wipe Aborted."
    exit 1
fi

echo "Wiping $DEVICE..."
sleep 3

# Pass 1: Zero fill
echo "Pass 1/3: /dev/zero"
dd if=/dev/zero of="$DEVICE" bs=1M status=progress
sync

# Pass 2: Random data
echo "Pass 2/3: /dev/urandom"
dd if=/dev/urandom of="$DEVICE" bs=1M status=progress
sync

# Pass 3: Zero fill again
echo "Pass 3/3: /dev/zero..."
dd if=/dev/zero of="$DEVICE" bs=1M status=progress
sync

echo "Secure wipe complete!"