# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=breeze-icons
pkgver=6.1.0
pkgrel=1
pkgdesc='Breeze icon theme'
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL)
makedepends=(extra-cmake-modules
             python-lxml
             qt6-base)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('b1ba802d0d0dbd0ecd786cbdfaaf545f2dd3c217966b894b9321a2a18426a16a'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB  # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D) # Jonathan Esk-Riddell <jr@jriddell.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBINARY_ICONS_RESOURCE=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
