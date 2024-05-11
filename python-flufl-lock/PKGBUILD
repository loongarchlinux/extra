# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl.lock
pkgname=python-flufl-lock
pkgver=8.1.0
pkgrel=2
pkgdesc="NFS-safe file locking with timeouts for POSIX systems for Python"
arch=(any)
url="https://gitlab.com/warsaw/flufl.lock"
license=(Apache-2.0)
depends=(
  python
  python-atpublic
  python-psutil
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-sybil
)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('756fa408e5c5f33e14f8708e4332f3c784f12ad02573622f6e763083635b5c3699d7f3dda1f82677ac492b86cde89e8d60086bab877866dc7b696b0bc93c9f6d')
b2sums=('6792a49ccd911890b0b04f9520e990be8f8db85a5d1873fec8c87d5cfaf4207c58317389655a9d0a62095ddc9e1c40569f0207f9aecc8984e83e995c7d57af07')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="src:$PYTHONPATH"
  pytest -vv -c /dev/null
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
