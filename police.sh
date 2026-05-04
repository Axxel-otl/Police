#!/bin/bash

FILE="$1"
MODE="$2"  # normal | reverse

[[ -f "$FILE" ]] || {
  echo "Config file not found: $FILE"
  exit 1
}

PAIR="$(cat "$FILE")"

TRIGGER="${PAIR%%::*}"
TARGET="${PAIR##*::}"

apply() {
  if [[ "$MODE" == "reverse" ]]; then
    [[ -e "$TRIGGER" ]] && chmod 000 "$TARGET" || chmod 1777 "$TARGET"
  else
    [[ -e "$TRIGGER" ]] && chmod 1777 "$TARGET" || chmod 000 "$TARGET"
  fi
}

LAST_STATE=""

while true; do
  CURRENT_STATE=$([[ -e "$TRIGGER" ]] && echo 1 || echo 0)

  if [[ "$CURRENT_STATE" != "$LAST_STATE" ]]; then
    apply
    LAST_STATE="$CURRENT_STATE"
  fi

  sleep 1
done