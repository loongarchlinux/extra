# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=archinfo
pkgname=python-${_pyname}
pkgver=9.2.69
pkgrel=1
pkgdesc='Classes with architecture-specific information useful to other projects'
url='https://github.com/angr/archinfo'
arch=('any')
license=('custom:BSD2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
  'python-capstone'
  'python-unicorn'
  'python-keystone'
  'python-pyvex'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('19600133666e45074b9653f64142d57cd9a77a391cfb531e6249a08d95ae2fd1dd14a8373714e743beca3ac5b6e7445098f144bca67434fdd2f7e6a6dccfe0a4')
b2sums=('1533cbb997fb0c173d7fbf6f734a59ede40a03e8f1cb749b5bd31be60d37ad23096a3199061922cd88a4de957b9d27bf3a5dea99951be91eb7fdf01234a67b23')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
