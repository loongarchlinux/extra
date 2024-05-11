# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=partd
pkgname=python-${_pkg}
pkgver=1.4.1
pkgrel=2
pkgdesc="Concurrent appendable key-value storage"
arch=(any)
url="https://github.com/dask/partd"
license=(BSD)
makedepends=(python-setuptools python-versioneer)
depends=(
    python
    python-locket
    python-toolz
)
optdepends=(
    python-blosc
    python-numpy
    python-pandas
    python-pyzmq
)
checkdepends=(
    python-pytest
    python-blosc
    python-numpy
    python-pandas
    python-pyzmq
)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha256sums=('56c25dd49e6fea5727e731203c466c6e092f308d8f0024e199d02f6aa2167f67')

prepare() {
  cd ${_pkg}-${pkgver}
  rm versioneer.py
}

build() {
  cd ${_pkg}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  PYTHONPATH="${PWD}"/build/lib pytest
}

package() {
  cd ${_pkg}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  # Install license file
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
