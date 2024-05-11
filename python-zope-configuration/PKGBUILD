# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-zope-configuration
pkgver=5.0.1
pkgrel=2
pkgdesc="Zope Configuration Markup Language (ZCML)"
arch=('any')
url="https://github.com/zopefoundation/zope.configuration"
license=('ZPL')
depends=('python-setuptools' 'python-zope-interface' 'python-zope-schema'
         'python-zope-i18nmessageid')
checkdepends=('python-zope-testing' 'python-zope-testrunner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/zope.configuration/archive/$pkgver.tar.gz")
sha512sums=('5fe39699851be8de2d69379ed11fbf5365b4c2cc790b1c8a2a82a2239e9516ad8a421a2e84fe1c034023927efefc211beabcda8aa1e0ad5643e374d74158f676')

build() {
  cd zope.configuration-$pkgver
  python setup.py build
}

check() {
  cd zope.configuration-$pkgver
  PYTHONPATH="$PWD/build/lib" python -m zope.testrunner --test-path=src
}

package() {
  cd zope.configuration-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
