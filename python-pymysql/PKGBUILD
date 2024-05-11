# Maintainer: David Runge <dvzrv@archlinux.org>

_name=PyMySQL
pkgname=python-pymysql
pkgver=1.1.0
pkgrel=3
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="https://github.com/PyMySQL/PyMySQL/"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# NOTE: tests require a running instance of mariadb
optdepends=(
  'mariadb: for using a local MariaDB instance'
  'python-cryptography: for RSA cryptography'
  'python-pynacl: for ed25519 cryptography'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('c5b2cc1716707013d06146f22ff6e36ae1e54deb8864226a65c5325bafd476d7c53076ceb5cb35815c1baeb8e0ba8d03230366662f4abc0a304e849d8cb40d34')
b2sums=('b1f5d38edc1ec93ddbf9f841b3db6bddb8db13bd7a6100de2104f08152e2ce7813f6ea2d09c4bc301a6b83fb3eeb3e4ce0c3b4faf42cec25b5c157ea71d719a1')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
