# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=m17n-db
pkgver=1.8.4
pkgrel=1
pkgdesc='Multilingual text processing library (database)'
url='https://www.nongnu.org/m17n/'
arch=('any')
license=('GPL')
depends=('glibc') # not because of compiling, but because of /usr/share/i18n/charmaps/ files that glibc provides
source=("https://download.savannah.gnu.org/releases/m17n/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b72cf4daa57518bad1582d5c8008908494580d3f1c7164d429809068623b6751')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

# Drop script that makes UIM segfault http://savannah.nongnu.org/bugs/index.php?53202
  rm "$pkgdir"/usr/share/m17n/hu-rovas-post.mim
}
