# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=pmbootstrap
pkgver=2.1.0
pkgrel=2
pkgdesc='Sophisticated chroot/build/flash tool to develop and install postmarketOS'
url='https://gitlab.com/postmarketOS/pmbootstrap'
arch=('any')
license=('GPL3')
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
sha256sums=('e634c962ee10500f321b8cf309afc2e8023cd0bbee953434768244375f86f72e')
b2sums=('1607ff761074e5f5b1fb3ad1ab5f0077b9238aaaf8e654a4df52f6bfe9790960890ea2f5ad27ebcdf1711c095ddb552a4dfc0d7dcc97e88249f27020ed2dc24b')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:
