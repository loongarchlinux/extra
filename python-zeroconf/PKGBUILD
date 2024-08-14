# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python-zeroconf
pkgver=0.132.2
pkgrel=1
pkgdesc="A pure python implementation of multicast DNS service discovery"
arch=('any')
url="https://github.com/jstasiak/python-zeroconf"
license=('LGPL')
depends=('python' 'python-netifaces' 'python-six' 'python-ifaddr' 'python-async-timeout')
makedepends=('python-setuptools' 'python-build' 'python-installer'
             'python-wheel' 'python-poetry-core' 'cython')
checkdepends=('python-pytest' 'python-pytest-cov')
source=($pkgname-$pkgver.tar.gz::https://github.com/jstasiak/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('a0188086e1806d19bf49f797b25a1eba9b14e60422931188af287a98b304b80e')

build() {
  cd "${pkgbase}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgbase}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
  cd "${pkgbase}-${pkgver}"
  pytest -k 'not test_integration_with_listener_ipv6' tests
}

# vim:set ts=2 sw=2 et:
