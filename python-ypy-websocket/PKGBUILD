# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=ypy_websocket
pkgname=python-ypy-websocket
pkgver=0.12.2
pkgrel=1
pkgdesc='WebSocket connector for Ypy'
arch=(any)
url='https://github.com/y-crdt/ypy-websocket'
license=(MIT)
depends=(python-y-py python-anyio python-aiosqlite)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest-asyncio python-websockets nodejs uvicorn)
source=(https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('1d0f876e6a586248c54b52735798cc473e5800f8cd4acd050b5d5f20f2ef9bf6')

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
