# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=notebook_shim
pkgname=jupyter-notebook-shim
pkgver=0.2.4
pkgrel=2
pkgdesc='Provides a way for JupyterLab and other frontends to switch to Jupyter Server for their Python Web application backend'
arch=(any)
url='https://github.com/jupyterlab/notebook_shim'
license=(BSD-3-Clause)
depends=(ipython
         jupyter-server
         python
         python-jupyter-core
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-jupyter
              python-pytest-tornasync)
source=(https://github.com/jupyter/notebook_shim/releases/download/v$pkgver/$_pyname-$pkgver.tar.gz)
sha256sums=('b4b2cfa1b65d98307ca24361f5b30fe785b53c3fd07b7a47e89acb5e6ac638cb')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver/$_pyname
  pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  mv "$pkgdir"/{usr/,}etc
}
