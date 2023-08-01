# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=async-lru
pkgname=python-$_pyname
pkgver=2.0.4
pkgrel=1
pkgdesc='Simple LRU cache for asyncio'
arch=(any)
url='https://github.com/aio-libs/async-lru'
license=(MIT)
depends=(python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-pytest-asyncio python-pytest-timeout)
source=(https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('b8a59a5df60805ff63220b2a0c5b5393da5521b113cd5465a44eb037d81a5627')

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
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
