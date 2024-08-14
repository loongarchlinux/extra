# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python-pylast
pkgver=5.3.0
pkgrel=1
pkgdesc='A Python interface to Last.fm and Libre.fm'
arch=(any)
url='https://github.com/pylast/pylast'
license=(Apache)
depends=(
  python-httpx
)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
_tag=de737fb4eedb827ddaa1b7eabd58c9abbded585c
source=(git+https://github.com/pylast/pylast.git#tag=${_tag})
b2sums=('195645e27348984e3a9d26ac24bec3518b89ebe679ffb30c5c57f5b7065ea4ac7866884b2b87adb02ab564936cf4c568983d2cf0a43845be5c779fe60beea014')

pkgver() {
  cd pylast
  git describe --tags
}

build() {
  cd pylast
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" pylast/dist/*.whl
}

# vim: ts=2 sw=2 et:
