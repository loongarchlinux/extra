# Maintainer: Antonio Rojas < arojas@archlinux.org >

pkgname=libreoffice-extension-texmaths
_extname=texmaths
pkgver=0.52.1
pkgrel=1
pkgdesc='A LaTeX equation editor for LibreOffice'
arch=(any)
url='http://roland65.free.fr/texmaths/'
license=(GPL2)
depends=(libreoffice
         texlive-basic)
source=(https://downloads.sourceforge.net/project/$_extname/$pkgver/TexMaths-$pkgver.oxt)
sha256sums=('aad1dc1fd967d26db58136468d3f0a1864ee9cca6466455a7b82b428386c262e')

package() {
  install -d -m755 "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname

  cp -r * "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname
  rm "$pkgdir"/usr/lib/libreoffice/share/extensions/$_extname/*.oxt
}
