# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-confuse
pkgver=2.0.1
pkgrel=1
pkgdesc='Painless YAML config files for Python'
arch=(any)
url=https://github.com/beetbox/confuse
license=(MIT)
depends=(python-yaml)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(python-nose)
_tag=eb041a8012b18f20d333b0da9aa4bc7f5a79f044
source=(git+https://github.com/beetbox/confuse.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd confuse
  git describe --tags | sed 's/^v//'
}

build() {
  cd confuse
  python -m build --wheel --no-isolation
}

check() {
  cd confuse
  python -m nose
}

package() {
  python -m installer --destdir="${pkgdir}" confuse/dist/*.whl
  install -Dm 644 confuse/LICENSE -t "${pkgdir}"/usr/share/licenses/python-confuse/
}

# vim: ts=2 sw=2 et:
