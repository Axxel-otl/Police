PREFIX="${PREFIX:-/usr}"

install -Dm755 police "$PREFIX/bin/police"
install -Dm755 police.sh "$PREFIX/lib/police/police.sh"
install -Dm644 systemd/police@.service "$PREFIX/lib/systemd/user/police@.service"
install -Dm644 config/example.conf "$PREFIX/etc/police.conf"
install -Dm644 LICENSE "$PREFIX/share/licenses/police/LICENSE"