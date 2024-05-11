# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=ypy_websocket
pkgname=python-ypy-websocket
pkgver=0.12.4
pkgrel=2
pkgdesc='WebSocket connector for Ypy'
arch=(any)
url='https://github.com/y-crdt/ypy-websocket'
license=(MIT)
depends=(python
         python-aiosqlite
         python-anyio
         python-y-py)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(nodejs
              python-pytest-asyncio
              python-websockets
              uvicorn)
source=(https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('cbbf5fdaa9a301a0b5f9455f1f29478b7c05b62773b2dd2a65c6502b4e10afa1')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v -k 'not test_ypy_yjs' # Fails on build.a.o
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
