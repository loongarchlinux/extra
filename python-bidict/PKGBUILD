# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Omar Pakker <archlinux@opakker.nl>

pkgname=python-bidict
_name=${pkgname#python-}
pkgver=0.23.1
pkgrel=2
pkgdesc='Bidirectional mapping library for Python'
url='https://bidict.readthedocs.org/'
arch=('any')
license=('MPL2')
depends=(
  python
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-sphinx
  python-sphinx-autodoc-typehints
  python-pytest-benchmark
  python-pytest-cov
  python-pytest-xdist
  python-hypothesis
  python-py-cpuinfo
  python-sortedcollections
)
source=(https://github.com/jab/bidict/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('b3619436e1e1e3cba15856839666edcb769fce97b47f5bba5e2789b03eed3156')
b2sums=('f114ee35f7f3c1cb6e9094f52ce776c976c8b94e0cb9891eec62772eddfdf8735549ea710359cfaaba28f71d7bf96057cc65533a771f9b33a37935e93e152aef')

build() {
  cd "bidict-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "bidict-${pkgver}"
  PYTHONPATH="build/lib" pytest
}

package() {
  cd "bidict-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
