# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-anysqlite
_name="${pkgname#python-}"
pkgver=0.0.5
pkgrel=2
pkgdesc="Sqlite3 for asyncio and trio "
arch=(any)
url="https://github.com/karpetrosyan/anysqlite"
license=(BSD-3-Clause)
depends=(
  python
  python-anyio
)
makedepends=(
  python-build
  python-hatch-fancy-pypi-readme
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-trio
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('22ae021bae68f5863b90ba927059b2d957becd5b29c24dda5c981f6f4092e3cc75d3c2376279a191ece19bb3278ef803ee2a36c10be2553c748e3b956fe61cd2')
b2sums=('92792ce3e71e4fdb3a2798569db30539b697bc6024aaa5d4e77e1411f01568c4e33f1cdf673d19f81578a82a24c4526468495ad3bed98df3d8c5149680a28bf2')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
