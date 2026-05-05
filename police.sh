#!/bin/bash

FILE="$1"

[[ -f "$FILE" ]] || {
  echo "Config not found: $FILE"
  exit 1
}

# Global config and then user override
source /etc/police.conf 2>/dev/null
source "$HOME/.config/police/config" 2>/dev/null

LOCKED="${LOCKED:-000}"
OPENED="${OPENED:-700}"

IFS="::" read -r MODE KEY LOCK < "$FILE"

[[ -z "$MODE" || -z "$KEY" || -z "$LOCK" ]] && {
  echo "Invalid config: $FILE"
  exit 1
}

LAST=""

while true; do
  CURRENT=$([[ -e "$KEY" ]] && echo 1 || echo 0)

  if [[ "$CURRENT" != "$LAST" ]]; then
    if [[ "$MODE" == "reverse" ]]; then
      [[ -e "$KEY" ]] && chmod "$LOCKED" "$LOCK" || chmod "$OPENED" "$LOCK"
    else
      [[ -e "$KEY" ]] && chmod "$OPENED" "$LOCK" || chmod "$LOCKED" "$LOCK"
    fi
    LAST="$CURRENT"
  fi

  sleep 1
done
