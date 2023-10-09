# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpcore
pkgname=python-httpcore
# https://github.com/encode/httpcore/blob/master/CHANGELOG.md
pkgver=0.18.0
pkgrel=1
pkgdesc="A minimal HTTP client"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python' 'python-anyio' 'python-h11' 'python-sniffio' 'python-certifi')
optdepends=(
  'python-h2: for HTTP/2 support'
  'python-socksio: for SOCKS support'
  'python-trio: for trio backend'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-fancy-pypi-readme'
             'python-h2')
checkdepends=('python-pytest-httpbin' 'python-pytest-trio' 'python-socksio')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('3dc8114bf02226fc4ac87408163e599f4e9f70f9e5663c9eb7dc9a65b2b72861f3b19ed2f87e29ac90a8b85c5dc32a3fffdaf88e83b15df838fcbd89737b1c57')

prepare() {
    cd ${_pkgname}-${pkgver}

    # disable -Werror, which often causes failures due to newer dependencies in Arch
    sed -i '/filterwarnings/d' pyproject.toml
}

build() {
    cd ${_pkgname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${_pkgname}-${pkgver}

    # raise open files limits, many tests will fail otherwise
    ulimit -S -n 4096

    python -m pytest
}

package() {
    cd ${_pkgname}-${pkgver}

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
