# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-aiosqlite
_pkgname=${pkgname#python-}
pkgver=0.20.0
pkgrel=1
pkgdesc="Asyncio bridge to the standard sqlite3 module"
arch=(any)
url="https://github.com/omnilib/aiosqlite"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-flit-core
  python-installer
)
checkdepends=(python-aiounittest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('63ecc7f7ffa0d0c2ba918b3c2bfe6f96b65fd7388b9041ae77b020ea8ff566db')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m unittest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
