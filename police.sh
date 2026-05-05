#!/bin/bash

FILE="$1"

[[ -f "$FILE" ]] || {
  echo "Config not found: $FILE"
  exit 1
}

source /etc/police.conf 2>/dev/null
source "$HOME/.config/police/config" 2>/dev/null

LOCKED="${LOCKED:-000}"
OPENED="${OPENED:-700}"

LINE="$(cat "$FILE")"

MODE="${LINE%%::*}"
REST="${LINE#*::}"
KEY="${REST%%::*}"
LOCK="${REST##*::}"

[[ -z "$MODE" || -z "$KEY" || -z "$LOCK" ]] && {
  echo "Invalid config: $FILE"
  exit 1
}

LAST=""

while true; do
  CURRENT=$([[ -e "$KEY" ]] && echo 1 || echo 0)

  if [[ "$CURRENT" != "$LAST" ]]; then
    if [[ -e "$LOCK" ]]; then
      if [[ "$MODE" == "reverse" ]]; then
        [[ "$CURRENT" == "1" ]] && chmod "$LOCKED" "$LOCK" || chmod "$OPENED" "$LOCK"
      else
        [[ "$CURRENT" == "1" ]] && chmod "$OPENED" "$LOCK" || chmod "$LOCKED" "$LOCK"
      fi
    fi

    LAST="$CURRENT"
  fi

  sleep 1
done