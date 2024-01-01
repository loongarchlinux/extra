# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-trio
pkgver=0.23.2
pkgrel=2
pkgdesc='A friendly Python library for async concurrency and I/O'
arch=(any)
url=https://github.com/python-trio/trio
license=(MIT)
depends=(
  python
  python-attrs
  python-exceptiongroup
  python-idna
  python-outcome
  python-sniffio
  python-sortedcontainers
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-setuptools
  python-installer
  python-wheel
)
provides=(python-multio-provider)
_tag=60172de0c37a0d87c341cef3ef13f565ace343e9
source=(git+https://github.com/python-trio/trio.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd trio
  git describe --tags | sed 's/^v//'
}

build() {
  cd trio
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" trio/dist/*.whl
  install -Dm 644 trio/LICENSE -t "${pkgdir}"/usr/share/licenses/python-trio/
}

# vim: ts=2 sw=2 et:
