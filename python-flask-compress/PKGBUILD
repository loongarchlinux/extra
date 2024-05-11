# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

_pyname=Flask-Compress
pkgname=python-flask-compress
pkgver=1.14
pkgrel=2
pkgdesc='Compress responses in your Flask app'
url='http://pypi.python.org/pypi/Flask-Compress/'
arch=('any')
license=('BSD')
depends=('python' 'python-flask' 'python-brotli')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=(https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz)
sha256sums=('e46528f37b91857012be38e24e65db1a248662c3dc32ee7808b5986bf1d123ee')
sha512sums=('7f30f64bddeaa06875725b6195348cdfb20d3fdd0d8a392f0fbeb209ad5a532bd222fc1c9ceadf7dcff614f2513a885724bfc165fccf162c889924e3b73bee3c')

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pyname}-${pkgver}
  PYTHONPATH="build/lib" pytest
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
