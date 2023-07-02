# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl_lock
pkgname=python-flufl-lock
pkgver=8.0.1
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
sha512sums=('059a0ed742d941f936a5a06f6fb0b72aa218fc4cd4c03788fcec6ddcef9fcc2bda767ff89a7d380ad79e07a2eec4840b32efc0921c0ff277d00a9fb8cbe80e4e')
b2sums=('07a837ec1965ae9c9f61a7601de0727bbab25b625744358e1c7e4c3112e26cd02db00fefe31d4900a2631d436eff8150aaddf6e80f8adb5e799bc9440ccea681')

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
