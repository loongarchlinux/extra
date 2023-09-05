# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=uvicorn
pkgver=0.23.2
pkgrel=1
pkgdesc='The lightning-fast ASGI server'
arch=(any)
url=https://github.com/encode/uvicorn
license=(BSD)
depends=(
  python
  python-asgiref
  python-click
  python-h11
  python-httptools
  python-uvloop
  python-websockets
)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)
_tag=f3040fba6a9c628c95fd510bcd9714367a0f4f4e
source=(git+https://github.com/encode/uvicorn#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd uvicorn
  git describe --tags
}

build() {
  cd uvicorn
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" uvicorn/dist/*.whl
  install -Dm 644 uvicorn/LICENSE.md -t "${pkgdir}"/usr/share/licenses/uvicorn/
}

# vim:set ts=2 sw=2 et:
