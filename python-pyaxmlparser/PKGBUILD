# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=pyaxmlparser
pkgname=python-${_pyname}
pkgver=0.3.31
pkgrel=1
pkgdesc='Parser for Android XML file and get Application Name without using Androguard'
url='https://github.com/appknox/pyaxmlparser'
arch=('any')
license=('Apache')
depends=('python' 'python-lxml' 'python-click' 'python-asn1crypto' 'python-magic')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('db421ef8666785993261803dda917f47af10906b620b729e12fdcb6bfb41405f8e219373600ed4d8210a2618bdb05fd1788c958568bcf434a69be53bc87cb6cf')
b2sums=('91a529d4fbc44ee9bec3ca9735e59625ff9c9d78c480ab527fac7d46211cce3267e27ce957191db5aa58c3619a152ee3060f56dc8ae7358f9d698eb6551f3c0b')

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pyname}-${pkgver}
  PYTHONPATH=build/lib pytest
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
