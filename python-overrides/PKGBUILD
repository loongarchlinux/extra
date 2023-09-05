# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Avery Warddhana <them+arch _ nullablevo id au>

_pyname=overrides
pkgname=python-$_pyname
pkgver=7.4.0
pkgrel=1
pkgdesc='A decorator to automatically detect mismatch when overriding a method'
url='https://github.com/mkorpela/overrides'
arch=(any)
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('9502a3cca51f4fac40b5feca985b6703a5c1f6ad815588a7ca9e285b9dca6757')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
