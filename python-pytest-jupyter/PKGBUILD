# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-pytest-jupyter
pkgver=0.8.0
pkgrel=1
pkgdesc='A pytest plugin for testing Jupyter core libraries and extensions'
arch=(any)
url='https://github.com/jupyter-server/pytest-jupyter'
license=(BSD)
depends=(jupyter-nbformat
         jupyter-server
         python
         python-ipykernel
         python-jupyter-client
         python-jupyter-core
         python-pytest
         python-pyzmq
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-timeout)
source=(https://github.com/jupyter-server/pytest-jupyter/releases/download/v$pkgver/pytest_jupyter-$pkgver.tar.gz)
sha256sums=('842817c300802c8608676bbb1460ba0081f2688cf5cb55b87d7bad5dcb0e9729')

build() {
  cd pytest_jupyter-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pytest_jupyter-$pkgver
  PYTHONPATH="$PWD" \
  pytest -v
}

package() {
  cd pytest_jupyter-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
