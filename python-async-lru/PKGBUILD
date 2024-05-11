# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=async-lru
pkgname=python-$_pyname
pkgver=2.0.4
pkgrel=3
pkgdesc='Simple LRU cache for asyncio'
arch=(any)
url='https://github.com/aio-libs/async-lru'
license=(MIT)
depends=(python)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-pytest-asyncio
              python-pytest-cov
              python-pytest-timeout)
source=(git+https://github.com/aio-libs/async-lru#tag=v$pkgver)
sha256sums=('b20e888a322c68460746a316cb36948dd73bc8bef98e7cc9776f63f2ec3d5170')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
