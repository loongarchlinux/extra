# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-help-colors
pkgname=python-click-help-colors
pkgver=0.9.2
pkgrel=1
pkgdesc="Colorization of help messages in Click"
arch=(any)
url="https://github.com/click-contrib/click-help-colors"
license=(MIT)
depends=(
  python
  python-click
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('1092b256339faf7399274c7cd525895f53e57f31e5d0d4a7068e0fa29e7757d14881a2fd980c501a7277a25ece760623fa4c967c60302359c880899c8a01652f')
b2sums=('ac8f4b0369f5a1d71115e92d84b6b2229f955c74d2ca443aa98319316d5a6d944d29ce4979fc2d8cd03dd5916c4ab6b0870172f2982a83df6d510e51b779ef60')

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
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 examples/*.py -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
