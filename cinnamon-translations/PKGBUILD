# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.0.2
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('e23fe7f7da8856f3794c970671242bfdda1d84fee7357a7d30e09de15f988b9293b49dcbb44687ba4c495708b4fe067d6e8b851fac190b7f1f123ae19745f375')
b2sums=('50b9813c608935830c772466ad01f5818d7775467127c486c1543e2c51f4b828b536436939cd50cb68adb562aa043edaed4d10839b8e17038668e0cd87253197')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr/ "${pkgdir}"
}
