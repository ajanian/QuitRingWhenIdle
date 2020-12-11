#!/bin/bash

threshold=$1

if [ -z "$threshold" ]; then
    threshold=300
fi

echo "Threshold: $threshold"

# code for idle seconds from https://gist.github.com/Neil-Smithline/2075463
idleSeconds=$(/usr/sbin/ioreg -c IOHIDSystem | /usr/bin/awk '/HIDIdleTime/ {print int($NF/1000000000); exit}')

echo "IdleSeconds: $idleSeconds"

if [ $idleSeconds -gt $threshold ]; then
    echo "Quitting Ring app"
    osascript -e 'quit app "Ring"'
else
    echo "Keeping Ring running..."
fi
