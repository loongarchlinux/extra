# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=aiosqlite
pkgname=python-$_pkgname
pkgver=0.19.0
pkgrel=4
pkgdesc='asyncio bridge to the standard sqlite3 module'
arch=(any)
url="https://github.com/omnilib/aiosqlite"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-aiounittest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('4e5b9d171dd8f6b95e29fa5fd05ec4ce3ba7e95293c57fbffdd5189a03d0eba03f9b318adef1da011e22bfa4bd6b914903ea578d68eefad558533ae21b75b79a')
b2sums=('2af94d97a04b3424aa1d36e953c9893e5bdc9b48edb737f4221ec79fb26a0cae9a802fb945c7ec3aa76ae44bc128726863da17ad18940a3d42ff4f4b63e2d3e9')

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  python -m unittest -v $_pkgname.tests
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
