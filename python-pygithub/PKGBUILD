# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pygithub
pkgver=2.1.1
pkgrel=1
pkgdesc="Use the full Github API v3"
arch=('any')
license=('LGPL')
url="https://github.com/PyGithub/PyGithub"
depends=('python-deprecated' 'python-pyjwt' 'python-requests' 'python-pynacl' 'python-dateutil')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest' 'python-cryptography' 'python-httpretty' 'python-parameterized')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PyGithub/PyGithub/archive/v$pkgver.tar.gz")
sha512sums=('a98da47b3c4cef564ebb746f83a26cedd17fae28da64c55484e7e6df0ccad91527a5fc138ea5436215462aed9844bd8a8b718ac4ebaa813243f2d821835d940f')

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
