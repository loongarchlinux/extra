# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Arkadiusz Laczynski <alaczynski@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>

pkgname=aspell-pl
pkgver=20230701
pkgrel=1
pkgdesc='Polish dictionary for aspell'
arch=('any')
url="https://www.sjp.pl/slownik/en/"
license=('GPL' 'LGPL' 'MPL' 'CC SA' 'Apache')
depends=('aspell')
source=(https://sjp.pl/sl/ort/sjp-aspell6-pl-6.0_$pkgver-0.tar.bz2)
sha256sums=('8561ce4265e3bfd1383736a6e91c32ccd47ddb25e40645fb4a43e94a5e0f4f78')

build() {
  cd aspell6-pl-6.0_$pkgver-0

  ./configure
  make
}

package() {
  cd aspell6-pl-6.0_$pkgver-0

  make DESTDIR="$pkgdir" install
}
