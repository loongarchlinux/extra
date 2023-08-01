# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=5.8.2
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('ccf678eb805c06932e35e8d44579e2f5b7c3dd4e1cda6a6bd184ef3da656ccbe62135ae960849e4aaf098ebe76b72760a5d542f134210760376f0d972b875279')
b2sums=('91e71f3f4142fa6adb80c39a782b2db2c1d8f9e3dc12ea5883e081c0b27660a15753e0f4d69a7b4f47b9350221e705ef361e1e5fc1c027b92805ec59b08a9e2a')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr/ "${pkgdir}"
}
