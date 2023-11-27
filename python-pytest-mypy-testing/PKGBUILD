# Maintainer:

_pyname=pytest-mypy-testing
pkgname=python-$_pyname
pkgver=0.1.1
pkgrel=1
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
sha256sums=('f3f9ba2f674f31155b11a128a8c9f9f662ec8d7230e9755adc4b063c9951ceab')

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
