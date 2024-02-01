# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=pycrdt_websocket
pkgname=python-${_pyname/_/-}
pkgver=0.12.7
pkgrel=1
pkgdesc='CRDTs based on Yrs'
arch=(any)
url='https://github.com/jupyter-server/pycrdt-websocket'
license=(MIT)
depends=(python
         python-aiosqlite
         python-anyio
         python-pycrdt)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest
              python-pytest-asyncio
              python-websockets
              uvicorn)
source=(https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('5ce1d3ad8ba5d3407400f3dcf5d96c9b9d9836fb421928ac5698dd094ed18cfa')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v -k 'not test_pycrdt_yjs.py'
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
