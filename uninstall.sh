#!/bin/bash

PREFIX="${PREFIX:-$HOME/.local}"

echo "Stopping all Police services..."

# Detener y deshabilitar TODAS las instancias
systemctl --user list-units --type=service "police@*.service" --no-legend \
| awk '{print $1}' | while read -r svc; do
  systemctl --user stop "$svc"
  systemctl --user disable "$svc"
done

echo "Removing binaries and services..."

rm -f "$PREFIX/bin/police"
rm -f "$PREFIX/lib/police/police.sh"
rm -f "$PREFIX/lib/systemd/user/police@.service"

echo "Removing user config..."

rm -rf "$HOME/.config/police"

echo "Removing global config..."

sudo rm -f /etc/police.conf 2>/dev/null

echo "Reloading systemd..."

systemctl --user daemon-reload

echo "Uninstalled completely."
