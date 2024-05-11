# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

_pyname=minidump
pkgname=python-${_pyname}
pkgver=0.0.23
pkgrel=2
pkgdesc='Python library to parse and read Microsoft minidump file format'
url='https://github.com/skelsec/minidump'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${url}/archive/refs/tags/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('df938d85196726db78f5c5a3809963fef8a1a473a4afb0869c271226166edf2e8c6329d1b0946fe297a2d7e01d4e1da55baa4b3ce59a74429b17434521bf4d6d')
b2sums=('1b0904b7ebba2cd9bf70882ea0bf375e1114454dab3deeccebce4fd7a9522f41523d15eb658a4ddf774c47973c8bf92b538add884a3421e12cca0e91ee28a031')

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
