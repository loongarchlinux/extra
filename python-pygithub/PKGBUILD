# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pygithub
pkgver=2.3.0
pkgrel=2
pkgdesc="Use the full Github API v3"
arch=('any')
license=('LGPL')
url="https://github.com/PyGithub/PyGithub"
depends=('python-deprecated' 'python-pyjwt' 'python-requests' 'python-pynacl' 'python-dateutil')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-cryptography' 'python-httpretty' 'python-parameterized')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PyGithub/PyGithub/archive/v$pkgver.tar.gz")
sha512sums=('aa0496b57550923fa304bd22100ed480cd2a9e909e9030014252e9106f7bde7ba16b1f693b88c9f17c672e58e1ae9a2a5f11adcf97fc6f4c7258eacbaf6fafc0')

build() {
  cd PyGithub-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python -m build --wheel --no-isolation
}

check() {
  cd PyGithub-$pkgver
  python -m pytest
}

package() {
  cd PyGithub-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
