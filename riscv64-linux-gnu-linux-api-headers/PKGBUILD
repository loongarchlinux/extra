# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_target_arch=riscv
_target=riscv64-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=6.8
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='https://www.kernel.org'
license=(GPL-2.0-only)
makedepends=('rsync')
source=(https://www.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-$pkgver.tar.{xz,sign})
sha256sums=('c969dea4e8bb6be991bbf7c010ba0e0a5643a3a8d8fb0a2aaa053406f1e965f3'
            'SKIP')
b2sums=('c6f17f816cea16e629f63e9379b98888713f57b2c5173306926471f139a9d612a0c74e119341f8075390e55e203d787d9edeb4ad5a064b18870f6f0f7ffaafb2'
        'SKIP')
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

build() {
  cd linux-$pkgver
  make ARCH=$_target_arch mrproper
}

package() {
  cd linux-$pkgver
  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/" ARCH=$_target_arch V=0 headers_install
}
