# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpx
pkgname=python-httpx
# https://github.com/encode/httpx/blob/master/CHANGELOG.md
pkgver=0.25.1
pkgrel=1
pkgdesc="A next generation HTTP client for Python"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python' 'python-certifi' 'python-httpcore' 'python-idna' 'python-sniffio'
         # Not directly used, but declared as anyio is no longer a hard dependency of newer httpcore
         # https://github.com/encode/httpx/pull/2885
         'python-anyio')
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
sha512sums=('ad67f45162e328dba3d74abc75cdae02cc4da1605e21456fbb2023f9f515efa6ec6c5799927a4a4557cf439819f9b05dc2805002e29b97102dadcf934cbd0e2b'
            'd3e6a9df365aff5e4e7b724469672c6da9c7e95cc5d79339ebd1ea249236802d81b8792efb0826f89747424fa1bef20d4965ddb75b3b67e9cd320b5fcc738f18')
b2sums=('f13340d5b051fa2020c12825c31df8f5566c3900baa54267cf0718eaff35b600186cfee5a0db5d7fd1a86fbb94bb0d164c7c9be3d6508cd30fc2fbc75cc0c833'
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
