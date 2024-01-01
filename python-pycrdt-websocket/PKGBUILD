# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=pycrdt_websocket
pkgname=python-${_pyname/_/-}
pkgver=0.12.6
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
sha256sums=('5a7b6f0dec774011d6898db3782adf7ea601f788537dc7af71dc8f06101699fe')

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
