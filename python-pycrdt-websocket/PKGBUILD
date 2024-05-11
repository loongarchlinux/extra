# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=pycrdt-websocket
pkgname=python-$_pyname
pkgver=0.13.4
pkgrel=1
pkgdesc='CRDTs based on Yrs'
arch=(any)
url='https://github.com/jupyter-server/pycrdt-websocket'
license=(MIT)
depends=(python
         python-anyio
         python-pycrdt
         python-sqlite-anyio)
makedepends=(git
             python-build
             python-hatchling
             python-installer)
checkdepends=(hypercorn
              python-httpx-ws
              python-pytest
              python-pytest-asyncio
              python-trio
              python-websockets
              uvicorn)
source=(git+https://github.com/jupyter-server/pycrdt-websocket#tag=v$pkgver)
sha256sums=('4c082022032eb5cc9e2189b4378a50bd35279ccfcd98859281d65d8c8049c3fb')

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v -k 'not test_pycrdt_yjs.py'
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
