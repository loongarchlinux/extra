# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-mediafile
pkgver=0.12.0
pkgrel=2
pkgdesc='Elegant audio file tagging'
arch=(any)
url=https://github.com/beetbox/mediafile
license=(MIT)
depends=(
  python-mutagen
  python-six
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(python-nose)
_tag=11c180078d6775f7c72dd182d9b6762061b677c7
source=(git+https://github.com/beetbox/mediafile.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd mediafile
  git describe --tags | sed 's/^v//'
}

build() {
  cd mediafile
  python -m build --wheel --no-isolation
}

check() {
  cd mediafile
  python -m nose
}

package() {
  python -m installer --destdir="${pkgdir}" mediafile/dist/*.whl
  install -Dm 644 mediafile/LICENSE -t "${pkgdir}"/usr/share/licenses/python-mediafile
}

# vim: ts=2 sw=2 et:
