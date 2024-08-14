# Maintainer: David Runge <dvzrv@archlinux.org>

_name=PyMySQL
pkgname=python-pymysql
pkgver=1.1.1
pkgrel=1
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
sha512sums=('ef46ab189760b2d68bb7582b20a537bc68c2719241a4939bff9a6311ab64cb2df852d437ab4b8dd41a0fb5ff620a78c67aa96ccd037d44899dc2886d16218e2c')
b2sums=('0621a0cdf014418b7eaa7241146a370f91a3163ea9c0f2b5121f979580ae7f960a47aa13c12597c8d2c2ba3c9264914e40a21a96d6473e8ba2d053478a56cf05')

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
