# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpx
pkgname=python-httpx
# https://github.com/encode/httpx/blob/master/CHANGELOG.md
pkgver=0.25.0
pkgrel=1
pkgdesc="A next generation HTTP client for Python"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python' 'python-certifi' 'python-httpcore' 'python-idna' 'python-sniffio')
optdepends=(
  'python-brotli: for brotli response decompression'
  'python-brotlicffi: for brotli response decompression'
  'python-h2: HTTP/2 support'
  'python-socksio: SOCKS proxy support'
  'python-click: command line client support'
  'python-rich: command line client support'
  'python-pygments: command line client support'
  'python-trio: alternative async library'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-fancy-pypi-readme'
             'python-pygments')
checkdepends=('python-pytest-asyncio' 'python-pytest-trio' 'python-typing_extensions' 'python-brotli' 'python-brotlicffi' 'python-h2' 'python-trustme' 'uvicorn' 'python-socksio'
              'python-rich' 'python-chardet')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "uvicorn-test-server-use-h11.diff")
sha512sums=('0be0f7ed53061d1dd9e0010d5a10adc6508bd49bf51e5ccf44f0aa2f54bdd067e3a7d1f37dfab80d3d374984aca2f20c346e46b8bc518826ce3371abc7291ee3'
            'd3e6a9df365aff5e4e7b724469672c6da9c7e95cc5d79339ebd1ea249236802d81b8792efb0826f89747424fa1bef20d4965ddb75b3b67e9cd320b5fcc738f18')
b2sums=('632a11917c35150be4aa9a946ae90493ba19b37697f97f82c36334a1004c57e9c256af54bcd0afbc2d5a67bd48f28c578285dd48473c8ccfd4b1c11e2c6bc069'
        'f7fc5aa67d59dfbf544ea2668a5df6449d1cb30f5adf1433d92ebbc0fd10d46fec592f1befe829e126d72240666b9c3ea1f69a9f2cca6f3f4e135a7e454be25d')

prepare() {
  cd ${_pkgname}-${pkgver}

  # fix tests
  patch -Np1 -i ../uvicorn-test-server-use-h11.diff

  # disable -Werror, which often causes failures due to newer dependencies in Arch
  sed -i '/"error",/d' pyproject.toml
}

build() {
  cd ${_pkgname}-${pkgver}

  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}

  pytest
}

package() {
  cd ${_pkgname}-${pkgver}

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
