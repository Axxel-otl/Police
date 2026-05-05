#!/bin/bash

PREFIX="${PREFIX:-$HOME/.local}"
SYSTEMD_USER_DIR="$HOME/.config/systemd/user"

echo "Installing Police..."

# Binarios
install -Dm755 police "$PREFIX/bin/police"
install -Dm755 police.sh "$PREFIX/lib/police/police.sh"

# Systemd (ruta correcta)
mkdir -p "$SYSTEMD_USER_DIR"
install -Dm644 systemd/police@.service "$SYSTEMD_USER_DIR/police@.service"

# Recargar systemd
systemctl --user daemon-reload

echo "Installed in $PREFIX"
echo "Systemd service installed in $SYSTEMD_USER_DIR"
