# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>

pkgname=cinnamon-translations
pkgver=6.2.2
pkgrel=1
pkgdesc="Translations for Cinnamon and Nemo"
arch=(any)
url="https://github.com/linuxmint/${pkgname}"
license=(GPL2)
options=(!emptydirs)
source=(${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('58f7aa285c786678fdcdbbbc4195a9c3cc7d0134535b693c6e517bda6d1afe3bd4de36eb32e75630e773d1de5a2733e069f9277daa3083572929a05190097c35')
b2sums=('336b64c305e1b6f04a9cfb54283d006f171fc8dbaa112412f5f1300439e8b58ae429e8aa11ccbcf223ef008e9f7b2943180c2989b3eeac8cfafda7902bdc04aa')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cp -r usr/ "${pkgdir}"
}
