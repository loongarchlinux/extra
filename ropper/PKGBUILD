# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=ropper
_pkgname=Ropper
pkgver=1.13.10
pkgrel=1
pkgdesc='Show information about binary files and find gadgets to build rop chains for different architectures'
url='https://github.com/sashs/Ropper'
arch=(any)
license=(BSD-3-Clause)
depends=(
  python
  python-capstone
  python-filebytes
  python-z3-solver
  python-pyvex
  python-archinfo
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(
  python-pytest
)
optdepends=(
  'python-keystone: assemble command support'
)
conflicts=('python-ropper')
replaces=('python-ropper')
provides=('python-ropper')
source=(https://github.com/sashs/${_pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('64afab433a633f10bb964af44e51c5d44885e03c718695284c3cfd73ea3f204561224d26575e1e376ca0c1424fe6ca859c5844a55798375223ea304e455d8c04')
b2sums=('c7b385fc2cf9f0777394899910d9433c09b9df0b5ba489b4fac71be3fbeeb4c1d68bdace6dcefb114aad3f89452745d04351a85003998bf3f8b148a774ea7a5a')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}
  py.test
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md sample.py -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
