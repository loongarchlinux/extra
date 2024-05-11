# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Avery Warddhana <them+arch _ nullablevo id au>

_pyname=overrides
pkgname=python-$_pyname
pkgver=7.7.0
pkgrel=2
pkgdesc='A decorator to automatically detect mismatch when overriding a method'
url='https://github.com/mkorpela/overrides'
arch=(any)
license=(Apache-2.0)
depends=(python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('55158fa3d93b98cc75299b1e67078ad9003ca27945c76162c1c0766d6f91820a')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
