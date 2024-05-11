# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=jupyter_server_terminals
pkgname=python-${_pyname//_/-}
pkgver=0.5.3
pkgrel=2
pkgdesc='A Jupyter Server extension providing terminals'
arch=(any)
url=https://github.com/jupyter-server/jupyter_server_terminals
license=(BSD-3-Clause)
depends=(jupyter-server
         python
         python-jupyter-core
         python-terminado
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-pytest-jupyter
              python-pytest-timeout)
source=(https://github.com/jupyter-server/jupyter_server_terminals/releases/download/v$pkgver/$_pyname-$pkgver.tar.gz)
sha256sums=('5ae0295167220e9ace0edcfdb212afd2b01ee8d179fe6f23c899590e9b8a5269')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname-$pkgver
  pytest -v
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/{usr/,}etc

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
