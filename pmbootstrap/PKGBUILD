# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=2.2.1
pkgrel=2
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS'
url='https://gitlab.com/postmarketOS/pmbootstrap'
arch=('any')
license=('GPL-3.0-only')
depends=(
  'python'
  'python-argcomplete'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://gitlab.com/postmarketOS/pmbootstrap/-/archive/$pkgver/pmbootstrap-$pkgver.tar.gz")
sha256sums=('195a3cb430c9ede354bc575ddb765f10b205067f8c478f153c84f6f793785c09')
b2sums=('578fdc26125f5b33fffb2926c32aec1dbaf78f87574ed051967a567214965ad9578091e48a0cbf91f0f6e10b5ff2b3fde0c70c854d6d2f208c2a41e482b04445')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:
