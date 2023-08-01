# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=pysolfc
pkgver=2.21.0
pkgrel=1
pkgdesc="PySol (Fan Club edition) is an exciting collection of more than 1000 solitaire games"
arch=('any')
url="http://pysolfc.sourceforge.net/"
license=('GPL3')
depends=('python-attrs' 'pysolfc-cardsets' 'python-configobj' 'python-pillow' 
         'python-pysol_cards' 'python-random2' 'python-six' 'tk' 'python-pygame')
makedepends=('python-setuptools')
source=(https://downloads.sourceforge.net/$pkgname/PySolFC-$pkgver.tar.xz)
sha256sums=('5ceae3a4cc609d1a53ad29e2e26fae6c59dedee9a7d2d6af07f0289a2daa383b')

prepare() {
  cd PySolFC-$pkgver

  sed -i 's/pysol.py/pysol/' data/pysol.desktop
}


package() {
  cd PySolFC-$pkgver

  python setup.py install --root="${pkgdir}"
  mv "${pkgdir}"/usr/bin/pysol.py "${pkgdir}"/usr/bin/pysol
}
