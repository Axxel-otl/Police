#!/bin/bash

FILE="$1"

[[ -f "$FILE" ]] || {
  echo "Config not found: $FILE"
  exit 1
}

# Global config + user override
source /etc/police.conf 2>/dev/null
source "$HOME/.config/police/config" 2>/dev/null

LOCKED="${LOCKED:-000}"
OPENED="${OPENED:-700}"

# FIX parsing correcto
read -r MODE KEY LOCK <<< "$(sed 's/::/ /g' "$FILE")"

[[ -z "$MODE" || -z "$KEY" || -z "$LOCK" ]] && {
  echo "Invalid config: $FILE"
  exit 1
}

LAST=""

while true; do
  if [[ -e "$KEY" ]]; then
    CURRENT=1
  else
    CURRENT=0
  fi

  if [[ "$CURRENT" != "$LAST" ]]; then
    if [[ "$MODE" == "reverse" ]]; then
      [[ "$CURRENT" == "1" ]] && chmod "$LOCKED" "$LOCK" || chmod "$OPENED" "$LOCK"
    else
      [[ "$CURRENT" == "1" ]] && chmod "$OPENED" "$LOCK" || chmod "$LOCKED" "$LOCK"
    fi
    LAST="$CURRENT"
  fi

  sleep 1
done
