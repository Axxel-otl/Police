#!/bin/bash

PREFIX="${PREFIX:-$HOME/.local}"

install -Dm755 police "$PREFIX/bin/police"
install -Dm755 police.sh "$PREFIX/lib/police/police.sh"
install -Dm644 systemd/police@.service "$PREFIX/lib/systemd/user/police@.service"

echo "Installed in $PREFIX"
