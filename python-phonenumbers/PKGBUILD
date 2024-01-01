# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-phonenumbers
pkgver=8.13.27
_commit=253657915796ddf75021526dd8abc9aa907df546
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd python-phonenumbers/python
  python setup.py build
}

check() {
  cd python-phonenumbers/python
  python setup.py test
}

package() {
  cd python-phonenumbers/python
  python setup.py install -O1 --root "$pkgdir"
}
