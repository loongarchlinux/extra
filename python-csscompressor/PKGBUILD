# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-csscompressor
_name="${pkgname#python-}"
pkgver=0.9.5
pkgrel=7
pkgdesc="Port of YUI CSS Compressor to Python"
arch=(any)
url="https://github.com/sprymix/csscompressor"
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('06be3e433555029c5b1207120f4fb8d16a44f7511eb709b35367b5a1024d015a8af5780db78f4568f3d62f44685309cf294ab8111f0ff20bd0c31bc7342892ee')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
