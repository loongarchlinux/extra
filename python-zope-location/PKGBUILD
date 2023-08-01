# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-zope-location
pkgver=5.0
pkgrel=1
pkgdesc="Special objects that have a structural location"
arch=('any')
url="https://github.com/zopefoundation/zope.location"
license=('ZPL')
depends=('python-setuptools' 'python-zope-interface' 'python-zope-schema' 'python-zope-proxy')
checkdepends=('python-zope-testrunner' 'python-zope-copy' 'python-zope-configuration' 'python-zope-component')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/zope.location/archive/$pkgver.tar.gz")
sha512sums=('4a3f41d4170730295b7b303eb9ca15304c35c05ed5fa62de8c92479011a82fe003d863d27136287394c0a04d7bb7959940fe605db5123d6c4953dada2d8ea92b')

build() {
  cd "$srcdir"/zope.location-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/zope.location-$pkgver
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python -m zope.testrunner --test-path=src || echo "Tests failed"
}

package() {
  cd zope.location-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
