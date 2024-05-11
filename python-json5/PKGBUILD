# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-json5
pkgver=0.9.25
pkgrel=2
pkgdesc='A Python implementation of the JSON5 data format'
arch=(any)
url='https://pypi.org/project/json5/'
license=(Apache-2.0)
depends=(python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-pytest)
source=(https://github.com/dpranke/pyjson5/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a31db9a7d2cd102051e27efd519b9670a3b6be7b9d951145637c0a3e2350e141')

build() {
  cd pyjson5-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pyjson5-$pkgver
  pytest -v
}

package() {
  cd pyjson5-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
