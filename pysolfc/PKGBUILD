# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=pysolfc
pkgver=3.0.0
pkgrel=1
pkgdesc="PySol (Fan Club edition) is an exciting collection of more than 1000 solitaire games"
arch=('any')
url="http://pysolfc.sourceforge.net/"
license=('GPL3')
depends=('python-attrs' 'pysolfc-cardsets' 'python-configobj' 'python-pillow' 
         'python-pysol_cards' 'python-random2' 'python-six' 'tk' 'python-pygame')
makedepends=('python-setuptools')
source=(https://downloads.sourceforge.net/$pkgname/PySolFC-$pkgver.tar.xz)
sha256sums=('5047ca10e8d5d635a0fbf7387c71b6c5e090e51a3ad2ab8a1bad649c0c3c9a17')

prepare() {
  cd PySolFC-$pkgver

  sed -i 's/pysol.py/pysol/' data/pysol.desktop
}


package() {
  cd PySolFC-$pkgver

  python setup.py install --root="${pkgdir}"
  mv "${pkgdir}"/usr/bin/pysol.py "${pkgdir}"/usr/bin/pysol
}
