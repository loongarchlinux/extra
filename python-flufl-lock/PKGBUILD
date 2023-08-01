# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl_lock
pkgname=python-flufl-lock
pkgver=8.0.2
pkgrel=1
pkgdesc="NFS-safe file locking with timeouts for POSIX systems for Python"
arch=(any)
url="https://gitlab.com/warsaw/flufl.lock"
license=(Apache)
depends=(
  python
  python-atpublic
  python-psutil
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
)
checkdepends=(
  python-pytest
  python-sybil
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('2ef382cf22be72ceace89ad01646db31186fa7f505d72306025b90e47dad46fa0831d951f515fc321b873acc4a339e2ae1ed1a4861c355bc9961e0a3ab209d7c')
b2sums=('e16af81933141628664bfcbece3ede038b150df468af00b840b9b7ad4aaa7e0e10c8a0ce415c685e2aa1e556198b2ac4f8339bdfa3e41c004c32592f0bd025bf')

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
