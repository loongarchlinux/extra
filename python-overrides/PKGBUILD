# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Avery Warddhana <them+arch _ nullablevo id au>

_pyname=overrides
pkgname=python-$_pyname
pkgver=7.3.1
pkgrel=2
pkgdesc='A decorator to automatically detect mismatch when overriding a method'
url='https://github.com/mkorpela/overrides'
arch=(any)
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('8b97c6c1e1681b78cbc9424b138d880f0803c2254c5ebaabdde57bb6c62093f2')

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
