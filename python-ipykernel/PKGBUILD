# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pyname=ipykernel
pkgname=python-$_pyname
pkgver=6.27.0
pkgrel=1
pkgdesc='The ipython kernel for Jupyter'
arch=(any)
url='https://pypi.org/project/ipykernel/'
license=(BSD)
depends=(ipython
         python
         python-comm
         python-jupyter-client
         python-jupyter-core
         python-nest-asyncio
         python-psutil
         python-pyzmq
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-debugpy
              python-flaky
              python-ipyparallel
              python-matplotlib
              python-pytest-asyncio
              python-pytest-timeout)
optdepends=('python-debugpy: debugger support')
source=(https://github.com/ipython/ipykernel/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('31eceb83dbc3d64f8ad01489673e4b1cb42480dad579679c11aed9b258e13ff8')

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
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
