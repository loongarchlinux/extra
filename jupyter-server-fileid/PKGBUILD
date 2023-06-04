# Maintainer: Antonio Rojas <arojas@archlinux.com>

_pyname=jupyter_server_fileid
pkgname=jupyter-server-fileid
pkgver=0.9.0
pkgrel=1
pkgdesc='A Jupyter Server extension providing an implementation of the File ID service'
arch=(any)
url='https://jupyter.org/'
license=(BSD)
depends=(jupyter-server)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest-jupyter)
source=(https://pypi.python.org/packages/source/j/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('171538b7c7d08d11dbc57d4e6da196e0c258e4c2cd29249ef1e032bb423677f8')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
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
