# Maintainer: Jelle van der Waa <jelle@archlinux.org>

_name=pytest-qt
pkgname=python-pytest-qt
pkgver=4.4.0
pkgrel=3
pkgdesc='pytest support for PyQt and PySide applications'
arch=(any)
license=('MIT')
url='https://github.com/pytest-dev/pytest-qt'
depends=('python-pytest')
makedepends=('python-setuptools-scm')
checkdepends=('python-pyqt5' 'xorg-server-xvfb')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('57c6a1866c7685db5301faa42298f11ef3d3a030cbc72fb109a8d6166621625fac89365671f781e5c3d652a190567bec3bae6f12cdab20812f43c7ef8e4518fa')

build() {
  cd ${_name}-$pkgver
  python setup.py build
}

check() {
  cd ${_name}-$pkgver/src
  PYTHONPATH=. PYTEST_QT_API=pyqt5 xvfb-run pytest --fixtures pytestqt ../tests
}

package() {
  cd ${_name}-$pkgver
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
