# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpcore
pkgname=python-httpcore
# https://github.com/encode/httpcore/blob/master/CHANGELOG.md
pkgver=0.17.3
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
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-h2')
checkdepends=('python-pytest-httpbin' 'python-pytest-trio' 'python-socksio')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('41f48d32caa7d7a3456528404392a257927d047f0a1c733e2a68c0fec97c7454c7f8d7d1b6851c5722cfac292dfaa478a4033c656e66d389c81c72dee8e7a7d2')

prepare() {
    cd ${_pkgname}-${pkgver}

    # disable -Werror, which often causes failures due to newer dependencies in Arch
    sed -i '/\berror\b/d' setup.cfg
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
