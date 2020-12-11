#!/bin/bash

threshold=$1

if [ -z "$threshold" ]; then
    threshold=300
fi

echo "Threshold: $threshold"

idleSeconds=$(/usr/sbin/ioreg -c IOHIDSystem | /usr/bin/awk '/HIDIdleTime/ {print int($NF/1000000000); exit}')

echo "IdleSeconds: $idleSeconds"

if [ $idleSeconds -gt $threshold ]; then
    echo "Quitting Ring app"
    osascript -e 'quit app "Ring"'
else
    echo "Keeping Ring running..."
fi
