# Maintainer:

_pyname=pytest-mypy-testing
pkgname=python-$_pyname
pkgver=0.1.3
pkgrel=2
pkgdesc='Plugin to test mypy output with pytest'
arch=(any)
license=(Apache
         MIT)
url='https://github.com/davidfritzsche/pytest-mypy-testing'
depends=(mypy
         python
         python-pytest)
makedepends=(python-build
             python-flit-core
             python-installer)
checkdepends=(python-pytest)
source=(https://github.com/davidfritzsche/pytest-mypy-testing/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('8b7702c0ded93d805ff60af52703de184a1d5a88a039647028bc8897c74283b5')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
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
  install -Dm644 LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname
}
