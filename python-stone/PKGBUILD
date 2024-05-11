# Maintainer:

pkgname=python-stone
_name=${pkgname#python-}
pkgver=3.3.3
pkgrel=3
pkgdesc='The Official API Spec Language for Dropbox API V2'
arch=(any)
url='https://github.com/dropbox/stone'
license=(MIT)
depends=(python python-ply python-six)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-coverage
  python-pytest
)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('f39e20a282eebe38ea44438f807d55762fc8dcd704cc56774944646a471f60d6')

prepare() {
  sed -e '/pytest-runner/d' -i $_name-$pkgver/setup.py # Remove pytest-runner from setup_requires

  # upstream doesn't seem to care about Python 3.11 compat: https://github.com/dropbox/stone/issues/288
  sed -e 's/getargspec/getfullargspec/' -i $_name-$pkgver/$_name/frontend/ir_generator.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
