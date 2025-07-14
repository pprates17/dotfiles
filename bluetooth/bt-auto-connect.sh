#!/usr/bin/env bash

MAC="CC:98:8B:56:76:81"
NAME="WH-1000XM3"

log() {
  echo "$1"
  notify-send "$1" "$2"
}

# Check if already connected
if bluetoothctl info "$MAC" | grep -q "Connected: yes"; then
  log "$NAME already connected" "$MAC"
  exit 0
fi

# Check if device is powered on / visible
if ! bluetoothctl devices | grep -q "$MAC"; then
  log "$NAME not visible" "Is it turned on?"
  exit 0
fi

# Try to connect up to 5 times
for i in {1..5}; do
  echo "Attempt $i: connecting to $NAME ($MAC)..."
  if bluetoothctl connect "$MAC"; then
    log "$NAME connected" "Successfully connected on attempt $i"
    exit 0
  fi
  sleep 5
done

log "$NAME failed to connect" "Tried 5 times and gave up."
exit 1

