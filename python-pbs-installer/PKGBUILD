# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pbs-installer
_name="${pkgname#python-}"
pkgver=2024.4.1
pkgrel=2
pkgdesc="Installer for Python Build Standalone"
arch=(any)
url="https://github.com/frostming/pbs-installer"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
)
optdepends=(
  'python-httpx: for download support'
  'python-zstandard: for zstd installation support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('407ffc7a7f5430d8f889f32b53614cc2c5e3fb05937905d6b43c7ca9151f3d5cb794bcd60633e4945dc62555cc6575d75e0b7b7a1e5dc0c9f99c2318fada3a10')
b2sums=('5455b00dd08881e78fbbc9b565e9224ee7d04f17855da9869fcb420fcbf8ee3743e6f21113d406bcfb66e786788735bd1ef2d3bfa30a14a5a74fb2c36e8f3d0a')

build() {
  cd $_name-$pkgver
  PDM_BUILD_SCM_VERSION=$pkgver python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
