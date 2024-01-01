# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=jupyter_server_fileid
pkgname=jupyter-server-fileid
pkgver=0.9.1
pkgrel=1
pkgdesc='A Jupyter Server extension providing an implementation of the File ID service'
arch=(any)
url='https://jupyter.org/'
license=(BSD)
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
sha256sums=('7486bca3acf9bbaab7ce5127f9f64d2df58f5d2de377609fb833291a7217a6a2')

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
