pkgname=police
pkgver=1.0.0
pkgrel=1
pkgdesc="File permission watcher based on key/lock system"
arch=('any')
url="https://github.com/Axxel-otl/Police"
license=('GPL3')
depends=('systemd')
source=("git+https://github.com/Axxel-otl/Police.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/Police"

  install -Dm755 police "$pkgdir/usr/bin/police"
  install -Dm755 police.sh "$pkgdir/usr/lib/police/police.sh"
  install -Dm644 systemd/police@.service "$pkgdir/usr/lib/systemd/user/police@.service"
  install -Dm644 config/example.conf "$pkgdir/etc/police.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/police/LICENSE"
}