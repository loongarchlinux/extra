# Maintainer:
# Contributor: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-scikit-build-core
_name=${pkgname#python-}
pkgdesc='Next generation Python CMake adaptor and Python API for plugins'
url='https://github.com/scikit-build/scikit-build-core'
pkgver=0.9.3
pkgrel=1
arch=(any)
license=(Apache-2.0)
depends=(
  cmake
  ninja
  python
  python-packaging
  python-pathspec
)
makedepends=(
  python-build
  python-hatchling
  python-hatch-vcs
  python-installer
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
)
sha512sums=('1e1ba9ea8ca20c2a49cd27631c8af4ebc7f0675248b0a260c1dafccb48351c57d140f991b7e5f8f29edfe1287c87225f6cfb1bcb431595c4f0f4c64a4f02edf6')
b2sums=('3800cd698a1353778c46e25649ac072c0912088930ec8fdf748d33099e46838e206888d677a6ca7f19c0f1c6dd2f03b1b230dd266b5a182b13ab4d4ecb989365')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# NOTE: upstream hardcodes downloading the internet with pip: https://github.com/scikit-build/scikit-build-core/issues/720

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
