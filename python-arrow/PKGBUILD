# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

pkgname=python-arrow
pkgver=1.3.0
pkgrel=1
pkgdesc='Better dates and times for Python'
arch=(any)
url=https://arrow.readthedocs.io
license=(APACHE)
depends=(
  python
  python-dateutil
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(python-tox)
_tag=87a1a774aad0505d9da18ad1d16f6e571f262503
source=(git+https://github.com/crsmithdev/arrow.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd arrow
  git describe --tags
}

build() {
  cd arrow
  python -m build --wheel --no-isolation
}

check() {
  cd arrow
  tox -e py311
}

package() {
  python -m installer --destdir="${pkgdir}" arrow/dist/*.whl
}

# vim: ts=2 sw=2 et:
