#!/bin/bash

PREFIX="${PREFIX:-/usr}"

systemctl --user stop 'police@*.service' 2>/dev/null
systemctl --user disable 'police@*.service' 2>/dev/null

rm -f "$PREFIX/bin/police"
rm -f "$PREFIX/lib/police/police.sh"
rm -f "$PREFIX/lib/systemd/user/police@.service"
rm -f "$PREFIX/etc/police.conf"
rm -rf "$PREFIX/share/licenses/police"

rm -rf "$HOME/.config/police"

systemctl --user daemon-reload

echo "Police removed completely"