# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-headers
_pkgname=Vulkan-Headers
pkgver=1.3.262
pkgrel=1
epoch=1
pkgdesc="Vulkan header files"
arch=(any)
url="https://www.khronos.org/vulkan/"
license=('APACHE')
makedepends=(cmake git)
provides=("vulkan-hpp=${pkgver}")
groups=(vulkan-devel)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/Vulkan-Headers/archive/v${pkgver}.tar.gz")
sha256sums=('317e467a5fb2eaa6a18b984ec70fdbfaccd93595a3e6f4bcceca7d3fab280505')

build() {
  cd Vulkan-Headers*

  rm -rf build ; mkdir build ; cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd Vulkan-Headers*/build
  
  make DESTDIR="${pkgdir}" install
}
