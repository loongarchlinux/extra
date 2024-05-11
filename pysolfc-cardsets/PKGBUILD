# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=pysolfc-cardsets
pkgver=3.0
pkgrel=1
pkgdesc="A collection of cardsets adapted for use with PySolFC"
arch=('any')
url="http://pysolfc.sourceforge.net/"
license=('GPL3')
source=(https://downloads.sourceforge.net/pysolfc/PySolFC-Cardsets-$pkgver.tar.bz2)
sha256sums=('279d1dc44068c7ae7bb47950c19992484edcaea6b61130227de9996cb08e3b0c')

package() {
  cd "${srcdir}"/PySolFC-Cardsets-$pkgver

  install -d "${pkgdir}"/usr/share/PySolFC
  cp -r * "${pkgdir}"/usr/share/PySolFC
}
