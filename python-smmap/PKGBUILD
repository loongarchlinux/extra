# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Carl George < arch at cgtx dot us >

_name=smmap
pkgname=python-smmap
pkgver=5.0.1
_commit=de9d9c2cdd90bf38856b85270343a23d1680fceb  # refs/tags/v5.0.1
pkgrel=1
epoch=1
pkgdesc="A pure git implementation of a sliding window memory map manager"
arch=(any)
url="https://github.com/gitpython-developers/smmap"
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("git+$url#tag=$_commit?signed")
sha512sums=('SKIP')
b2sums=('SKIP')
validpgpkeys=('27C50E7F590947D7273A741E85194C08421980C9') # Sebastian Thiel (In Rust I trust!) <byronimo@gmail.com>

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  pytest -v
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
