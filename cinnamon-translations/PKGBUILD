# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.0.1
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b0f064362733db1f1359f27a0df7258477f4ab8f04131f8e9a5bae36b3e534e9dac9d0a4708bb881443878427162182d6f5d646142f88ed767c768641ab6d7cb')
b2sums=('af54f45bf071ecbbb24a49f3a84aacef675db9bab00490382aaec7f1c0de66054de26acd6640afeed1bfcb2215f6fb211ba0bf5e92713306c93da8edbc3751ae')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr/ "${pkgdir}"
}
