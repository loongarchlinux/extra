# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-ipython-genutils
_name=ipython_genutils
pkgver=0.2.0
pkgrel=3
pkgdesc='Vestigial utilities from IPython'
arch=(any)
url='http://ipython.org/'
license=(BSD)
depends=(python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-nose)
source=(https://files.pythonhosted.org/packages/source/i/$_name/$_name-$pkgver.tar.gz
        python-3.12.patch)
sha256sums=('eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8'
            '9733e6604a67e2e7652436827e7c5f72326c15f84403b0b2985abd3fce936f96')

prepare() {
  patch -d $_name-$pkgver -p1 < python-3.12.patch # Fix tests with python 3.11
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  nosetests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
