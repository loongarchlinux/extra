# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyjwt
pkgver=2.7.0
pkgrel=1
pkgdesc='JSON Web Token implementation in Python'
arch=(any)
url=https://github.com/jpadilla/pyjwt
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-cryptography
  python-pytest
)
_tag=d7c54dbebdab2ae17f7948fd4432b15e1bb82852
source=(git+https://github.com/jpadilla/pyjwt.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd pyjwt
  git describe --tags
}

build() {
  cd pyjwt
  python -m build -wn
}

check() {
  cd pyjwt
  pytest
}

package() {
  python -m installer -d "${pkgdir}" pyjwt/dist/*.whl
  install -Dm 644 pyjwt/LICENSE -t "${pkgdir}"/usr/share/licenses/python-pyjwt/
}

# vim: ts=2 sw=2 et:
