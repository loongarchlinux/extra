# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-nkdfu
_name="${pkgname#python-}"
pkgver=0.2
pkgrel=4
pkgdesc="Python tool for Nitrokeys' firmware update"
arch=(any)
url="https://github.com/Nitrokey/nkdfu"
license=(GPL-2.0-only)
depends=(
  python
  python-fire
  python-tqdm
  python-intelhex
  python-libusb1
)
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-wheel
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('3b94b65115e84ca0a065746f92415d7be436484fd9a949ac841955ffd98a061ec7c9016f1d9bc05af1006fcfc2ca21a94f51a0d3a036c27945cf568b75cc7d58')
b2sums=('dbd01a333391ae94fccae6cf7cecccce2b742fcb91fab421208236cfa7576b1a31ebf21dd168813534c8ca401d964c12b73d340ddd8e6e6ca009257a1a306f5e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
