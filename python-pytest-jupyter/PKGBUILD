# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-pytest-jupyter
pkgver=0.10.1
pkgrel=2
pkgdesc='A pytest plugin for testing Jupyter core libraries and extensions'
arch=(any)
url='https://github.com/jupyter-server/pytest-jupyter'
license=(BSD-3-Clause)
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
sha256sums=('00df54eef9e201dd542d5471b8980def15d34b917b30587d14d7c824fc4d9e84')

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
