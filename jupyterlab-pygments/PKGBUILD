# Maintainer: 
# Contributor: Kyle Keen <keenerd@gmail.com>

_pyname=jupyterlab_pygments
pkgname=${_pyname/_/-}
pkgver=0.2.2
pkgrel=1
pkgdesc='Pygments theme using JupyterLab CSS variables'
arch=(any)
url='https://github.com/jupyterlab/jupyterlab_pygments'
license=(BSD)
depends=(python-pygments)
makedepends=(python-build python-installer python-jupyter-packaging)
conflicts=(jupyterlab_pygments)
provides=(jupyterlab_pygments)
replaces=(jupyterlab_pygments)
source=(https://pypi.io/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz)
sha256sums=('7405d7fde60819d905a9fa8ce89e4cd830e318cdad22a0030f7a901da705585d')

build() {
  cd $_pyname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
