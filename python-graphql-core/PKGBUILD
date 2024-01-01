# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-graphql-core
pkgver=3.2.3
pkgrel=3
pkgdesc='GraphQL base implementation for Python'
url=https://github.com/graphql-python/graphql-core
arch=(any)
license=(MIT)
depends=(
  python-six
  python-promise
  python-rx
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-setuptools
  python-wheel
)
_tag=430ee891a52d239adadf133d873fdca2a3fe009b
source=(git+https://github.com/graphql-python/graphql-core.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd graphql-core
  git describe --tags | sed 's/^v//'
}

build() {
  cd graphql-core
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" graphql-core/dist/*.whl
  install -Dm 644 graphql-core/LICENSE -t "${pkgdir}"/usr/share/licenses/python-graphql-core/
}

# vim: ts=2 sw=2 et:
