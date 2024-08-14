# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-ldap3
pkgver=2.9.1
pkgrel=6
pkgdesc="A strictly RFC 4510 conforming LDAP V3 pure Python client library"
url="https://github.com/cannatag/ldap3"
license=('LGPL')
arch=('any')
depends=('python-pyasn1')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cannatag/ldap3/archive/v$pkgver.tar.gz")
sha512sums=('bf07ebca9a53a8c225bc3106d3bd45eb26557c6e5a3d6d45a7f8c149d938ad43825eed0d406a57b93e2e675ed7aa262828f022ab82eb683f0e3029e3ad823106')

prepare() {
  cd "$srcdir"/ldap3-$pkgver
  # Remove test should be run with a server but is not marked as such
  # https://github.com/cannatag/ldap3/issues/1145
  rm test/testLDIF-change.py
}

build() {
  cd "$srcdir"/ldap3-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/ldap3-$pkgver
  export SERVER="NONE"
  python -m unittest discover -vs .
}

package() {
  cd ldap3-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
