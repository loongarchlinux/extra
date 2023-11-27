# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.0.0
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('8c77563c134ba1ec915ecd67c7b946fd982f9059dd924ebee9e7c8469b726b72af1b9b30f4e277128ed16b66a5c9d3bd2ec1de0b6e31b39e00139025598d2204')
b2sums=('007b68378a7593ebffac70301eb3ce9d1ea02d19d14db2a2353afe11b19eae3a3589411e0224e8c4e76b678a7b64783718d4c26f4677a68350b1f79443e89764')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr/ "${pkgdir}"
}
