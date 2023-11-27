# Maintainer: Filipe Laíns (FFY00) <lains@archlçinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=java-commons-io
pkgver=2.14.0
pkgrel=1
pkgdesc='IO related classes for Java.'
arch=('any')
url='https://commons.apache.org/io/'
license=('APACHE')
depends=('java-runtime')
source=("https://www.apache.org/dist/commons/io/binaries/commons-io-$pkgver-bin.tar.gz"{,.asc})
sha512sums=('a15eb43dede3c82895fe0411963ce2ba7b75716378dd93aa02f68f909f8777fdba8d738d7f895e7c4d6931bf0bba18fd409b5f6c7e0f02452047ac71f8dba313'
            'SKIP')
validpgpkeys=('6BDACA2C0493CCA133B372D09C4F7E9D98B1CC53'  # Benson Margulies
              'CD5464315F0B98C77E6E8ECD9DAADC1C9FCC82D0'  # Benedikt Ritter
              '2DB4F1EF0FA761ECC4EA935C86FDC7E2A11262CB') # Gary David Gregory (Code signing key) <ggregory@apache.org>

package() {
  install -Dm 644 "$srcdir"/commons-io-$pkgver/commons-io-$pkgver.jar "$pkgdir"/usr/share/java/commons-io/commons-io.jar
}
