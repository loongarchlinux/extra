# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=opencl-clhpp
pkgver=2023.04.17
pkgrel=1
pkgdesc='OpenCL C++ header files'
arch=('any')
url='https://github.com/KhronosGroup/OpenCL-CLHPP'
license=('custom')
makedepends=('cmake' 'doxygen' 'graphviz' 'opencl-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/OpenCL-CLHPP/archive/v${pkgver}.tar.gz")
sha256sums=('179243843c620ef6f78b52937aaaa0a742c6ff415f9aaefe3c20225ee283b357')
depends=('opencl-headers')

build() {
  cmake -B build -S OpenCL-CLHPP* \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_EXAMPLES=Off \
    -DBUILD_DOCS=On \
    -DBUILD_TESTING=Off 

  make -C build docs
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"
  cp -r build/docs/html/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
  install -D -m644 OpenCL-CLHPP*/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
