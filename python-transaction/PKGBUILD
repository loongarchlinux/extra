# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-transaction
pkgver=4.0
pkgrel=2
pkgdesc='Transaction management for Python'
arch=('any')
license=('ZPL')
url='https://github.com/zopefoundation/transaction'
depends=('python-zope-interface')
makedepends=('python-setuptools')
checkdepends=('python-zope-testrunner')
source=("https://github.com/zopefoundation/transaction/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4713f0caec822543e8b67778a968706d4e495dba4d1741ac7480b67f2659caf6cee67d161755b60130d6a04aa6e5a31973a41a1a4aa95254fdfc49c5af0d14ba')

build() {
  cd transaction-$pkgver
  python setup.py build
}

check() {
  cd transaction-$pkgver
  PYTHONPATH="$PWD"/build/lib zope-testrunner --test-path=src
}

package() {
  cd transaction-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
