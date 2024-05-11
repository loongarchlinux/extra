# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-graphql-core
pkgver=3.2.3
pkgrel=5
pkgdesc='GraphQL base implementation for Python'
url=https://github.com/graphql-python/graphql-core
arch=(any)
license=(MIT)
depends=(
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-pytest-benchmark
)
source=(git+$url.git#tag=v$pkgver)
sha256sums=('ddd4812fb7d3bdcf5904e0381d995d82e2afc2770cb78103eebdddae4cd53b43')

build() {
  cd graphql-core
  python -m build --wheel --no-isolation
}

check() {
  cd graphql-core
  PYTHONPATH="$PWD/src" pytest -vv -o addopts=''
}

package() {
  python -m installer --destdir="${pkgdir}" graphql-core/dist/*.whl
  install -Dm 644 graphql-core/LICENSE -t "${pkgdir}"/usr/share/licenses/python-graphql-core/
}

# vim: ts=2 sw=2 et:
