# Maintainer: David Runge <dvzrv@archlinux.org>

_name=robot-detection
pkgname=python-robot-detection
pkgver=0.4.0
pkgrel=8
pkgdesc="Detect web crawlers using HTTP User Agent"
arch=(any)
url="https://github.com/amandasaurus/robot-detection"
license=(GPL-3.0-or-later)
depends=(
  python
  python-six
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('10b1fbd2307c375e3cd067e43bee1bc0ff71f4b83ede9b92d2fb8d60edfd6d4a8d1a4d06d74e3c0653056f2e2b2cb81a7e997047093e925bd79bf4626d33d85f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python -m unittest discover -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
