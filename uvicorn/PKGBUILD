# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=uvicorn
pkgver=0.30.5
pkgrel=1
pkgdesc='The lightning-fast ASGI server'
arch=(any)
url=https://github.com/encode/uvicorn
license=(BSD-3-Clause)
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
_tag=ff54b029b15adc5259cfbbfa2749778179c48d37
source=(git+https://github.com/encode/uvicorn#tag=${_tag})
b2sums=('5342b0caddb7a1e26cac439a180a94cd461988a2b76270af94cd77add26083a91addf576408fb1e0b5583e955fb931de702734084c0212d2c8dce0cd65e136ba')

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
