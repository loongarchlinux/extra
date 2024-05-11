# Maintainer: David Runge <dave@sleepmap.de>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python-vobject
_name=${pkgname#python-}
pkgver=0.9.7
pkgrel=3
pkgdesc='Module for parsing and generating vCard and vCalendar files'
arch=('any')
url=http://py-vobject.github.io
license=('Apache-2.0')
depends=(
  'python'
  'python-dateutil'
  'python-six'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+https://github.com/py-vobject/vobject.git#tag=v$pkgver")
b2sums=('1ca6a32d3658632aeb4b5c9e43f77dc7c02229fec0857a5a14a3210b98afa7b5f82e4555252cb6c33753b03521710ba89d6aa8d237b3aa8139d7cfb52c4ccfe5')

build() {
  cd "${_name}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_name}"
  python tests.py
}

package() {
  cd "${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 {ACKNOWLEDGEMENTS.txt,README.md} \
    -t "${pkgdir}/usr/share/${pkgname}"
}
