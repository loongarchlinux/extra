# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-tlv8
_name="${pkgname#python-}_python"
pkgver=0.10.0
pkgrel=3
pkgdesc="Python module to handle type-length-value (TLV) encoded data"
arch=(any)
url="https://github.com/jlusiardi/tlv8_python"
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('46c1e85f5a9aec80771d0a3a56ebe72cd09f531f221dd015c0486fc1986d3a5624bcb2533850c88db9d7b462993820012e7c04c641f0d3e0e1466cb2ea12d94f')
b2sums=('f66f4f5c678a0bdd7ca45878841739aad53eb119bf184ac4665e280611eb286cefa3a99355580793f97fe6a89580291cea812019e49ec64aad420fb6c4843c25')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python -m unittest discover -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
