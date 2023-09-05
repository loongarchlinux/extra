# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=whatthepatch
pkgname=python-${_pkg}
pkgver=1.0.5
pkgrel=1
pkgdesc="A Python patch parsing library"
arch=(any)
url="https://github.com/cscorley/whatthepatch"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
#source=(${url}/archive/v${pkgver}rel/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7f374c172812581bc3763587525d14a143aac7fe4220bc4676ecce0d86cb8f08')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkg}-${pkgver}
  PYTHONPATH="${PWD}"/build/lib/ pytest -vv --color=yes
}

package() {
  cd ${_pkg}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
