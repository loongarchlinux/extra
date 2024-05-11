# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=jupyter_server_fileid
pkgname=jupyter-server-fileid
pkgver=0.9.2
pkgrel=2
pkgdesc='A Jupyter Server extension providing an implementation of the File ID service'
arch=(any)
url='https://jupyter.org/'
license=(BSD-3-Clause)
depends=(jupyter-server
         python
         python-click
         python-jupyter-core
         python-jupyter-events
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-jupyter)
source=(https://github.com/jupyter-server/$_pyname/releases/download/v$pkgver/$_pyname-$pkgver.tar.gz)
sha256sums=('ffb11460ca5f8567644f6120b25613fca8e3f3048b38d14c6e3fe1902f314a9b')

build() {
  cd $_pyname-$pkgver
  python -m build -wn
}

check() {
  cd $_pyname-$pkgver
# https://github.com/jupyter-server/jupyter_server_fileid/issues/58
  pytest -v -k 'not test_get_path_oob_move_nested and not test_get_path_oob_move_deeply_nested'
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  mv "$pkgdir"/{usr/,}etc
}
