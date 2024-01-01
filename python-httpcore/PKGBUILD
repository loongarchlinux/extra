# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpcore
pkgname=python-httpcore
# https://github.com/encode/httpcore/blob/master/CHANGELOG.md
pkgver=1.0.2
pkgrel=2
pkgdesc="A minimal HTTP client"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python' 'python-h11' 'python-certifi')
optdepends=(
  'python-h2: for HTTP/2 support'
  'python-socksio: for SOCKS support'
  'python-anyio: for asyncio backend'
  'python-trio: for trio backend'
  # Used but not listed in pyproject.toml. Probably upstream relies on transitive dependency anyio -> sniffio
  'python-sniffio: for async support'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-fancy-pypi-readme'
             'python-h2' 'python-socksio' 'python-trio' 'python-anyio' 'python-sniffio')
checkdepends=('python-pytest-httpbin' 'python-pytest-trio')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "allow-older-anyio.diff")
sha512sums=('6fc0c686b0b02b1e822550c18a7a90d2501f9d530598511877ee8cb09a0bdc4d56afe48cbb5fab5f8c1a12ea443055fe2a081b990fa4270f84db8197646b4979'
            '5be9cca027e67dafad716ffd68001f2eb4560e71cd213c0c4833c985313ced0cff50e924a54a3773732a3909a75e842ddf3c0b9ecaea5015dea9f934837a2e61')

prepare() {
    cd ${_pkgname}-${pkgver}

    patch -Np1 -i ../allow-older-anyio.diff
}

build() {
    cd ${_pkgname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${_pkgname}-${pkgver}

    # raise open files limits, many tests will fail otherwise
    ulimit -S -n 4096

    # Overrides -Werror via -Wdefault, as the former often causes failures due to newer dependencies in Arch
    python -m pytest -Wdefault
}

package() {
    cd ${_pkgname}-${pkgver}

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
