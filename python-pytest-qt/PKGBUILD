# Maintainer: Jelle van der Waa <jelle@archlinux.org>

_name=pytest-qt
pkgname=python-pytest-qt
pkgver=4.3.1
pkgrel=1
pkgdesc='pytest support for PyQt and PySide applications'
arch=(any)
license=('MIT')
url='https://github.com/pytest-dev/pytest-qt'
depends=('python-pytest')
makedepends=('python-setuptools-scm')
checkdepends=('python-pyqt5' 'pyside2' 'xorg-server-xvfb')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('e77bd0817f9dfb492ddcd9cb605b07d1e468ce7b52dce7519f2f96afd004f7796a028998572c589444e9737278a84efb887c801fb3bcc79a71c48ab849070114')

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
