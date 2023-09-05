# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pygithub
pkgver=1.59.1
pkgrel=1
pkgdesc="Use the full Github API v3"
arch=('any')
license=('LGPL')
url="https://github.com/PyGithub/PyGithub"
depends=('python-deprecated' 'python-pyjwt' 'python-requests' 'python-pynacl')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest' 'python-cryptography' 'python-httpretty' 'python-parameterized')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PyGithub/PyGithub/archive/v$pkgver.tar.gz")
sha512sums=('b3f30274174cf866ac9b4422f05aa34669bb12611b1f5f307873d4c539de18a20410d5d913f9692d4fc04b6d1b932c42b3375462d1520d26d8db4d20253ecbed')

build() {
  cd PyGithub-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python setup.py build
}

check() {
  cd PyGithub-$pkgver
  python -m pytest
}

package() {
  cd PyGithub-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python setup.py install --root="$pkgdir" --optimize=1
}
