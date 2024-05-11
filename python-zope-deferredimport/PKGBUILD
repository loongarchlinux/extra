# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-zope-deferredimport
pkgver=5.0
pkgrel=2
pkgdesc="Allows you to perform imports names that will only be resolved when used in the code"
arch=('any')
url="https://github.com/zopefoundation/zope.deferredimport"
license=('ZPL')
depends=('python-setuptools' 'python-zope-proxy')
checkdepends=('python-zope-testrunner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/zope.deferredimport/archive/$pkgver.tar.gz")
sha512sums=('bbc840ed0e0c03c87840f2a2290710c149258d3f63eeef2d6192d57d9f7dea42e29ae91adfa8b80e90ce2301aedd73c5426700eee42cdd3282d33bb1c8b6855f')

build() {
  cd "$srcdir"/zope.deferredimport-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/zope.deferredimport-$pkgver
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python -m zope.testrunner --test-path=src
}

package() {
  cd zope.deferredimport-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
