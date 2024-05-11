# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-svglib
_name="${pkgname#python-}"
pkgver=1.5.1
pkgrel=3
pkgdesc="Read SVG files and convert them to other formats"
arch=(any)
url="https://github.com/deeplook/svglib"
license=(LGPL-3.0-only)
depends=(
  python
  python-lxml
  python-reportlab
  python-tinycss2
  python-cssselect2
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pillow
  python-pytest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('5cd93db39078c7598a51e08afee08b689c4c95e5ac6340d1a51f85b6459fa4635b8edf45add3b39d0a079f0177a99b3d4786e40fb6276aa5ba80c9b5513e6d4c')
b2sums=('e147df6c5326f0ed27ffa56a158442b7727946cd9f51577df36b05b04ffa7ee6b8112736eab92e214ef26b7d055506844820b323e5342e04efbd615a7b8f982f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable tests that need remote resources
    --ignore tests/test_samples.py
  )

  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,CONTRIBUTORS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
