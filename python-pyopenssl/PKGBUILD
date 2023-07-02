# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=23.2.0
pkgrel=1
arch=('any')
pkgdesc="Python3 wrapper module around the OpenSSL library"
url='https://github.com/pyca/pyopenssl'
license=('Apache')
depends=('python-cryptography')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pretend' 'python-flaky')
source=(https://github.com/pyca/pyopenssl/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('cd64872d828c05df6db4b11e6c7dc3d34f31ec4d0be1e665b3d96e8c08c1226518fe252d80642fe9597c822b33ad0c6f3e83874001ab984eb81b159bef109983')

prepare() {
  export LC_CTYPE=en_US.UTF-8
}

build() {
  cd pyopenssl-$pkgver
  python setup.py build
}

check() {
  cd pyopenssl-$pkgver
  PYTHONPATH="$PWD"/build/lib pytest
}

package() {
  cd pyopenssl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
