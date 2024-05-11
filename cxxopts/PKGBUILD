# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=cxxopts
pkgver=3.2.1
pkgrel=1
pkgdesc="Lightweight C++ command line option parser"
arch=(any)
url="https://github.com/jarro2783/cxxopts"
license=(MIT)
makedepends=(cmake)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('7841fb3e6c3c2a057917c962e29fc0090e6ed06f5515aaa5e2a868fef59071a9a99b74d81c32cf613ecf10a68a4d96d6ad07805f48c7c3951ded096a2317dc3d')
b2sums=('891657d5c00213ae79a1f7600627829f114cf17c3f5c332b1a1c2dcdf2ba7c4a46826f5e0bdff2c09803396fdf133c12d35f6d76b01e473c83bc0fc130821ad4')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/{CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
