# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-utils
pkgver=6.2.1
_commit=a5941e8f845534e3604dacf2dfa9a87d224eeef8
pkgrel=1
pkgdesc="Oslo Utility library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.utils/$pkgver"
license=('Apache')
depends=('python-iso8601' 'python-oslo-i18n' 'python-pytz' 'python-netaddr'
         'python-netifaces' 'python-debtcollector' 'python-pyparsing' 'python-packaging')
makedepends=('git' 'python-setuptools')
checkdepends=('python-eventlet' 'python-testscenarios' 'python-testtools' 'python-oslotest'
              'python-ddt' 'python-stestr')
source=("git+https://github.com/openstack/oslo.utils.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd oslo.utils
  # We have system tzdata
  sed -i '/tzdata/d' requirements.txt
}

build() {
  cd oslo.utils
  python setup.py build
}

check() {
  cd oslo.utils
  stestr run
}

package() {
  cd oslo.utils
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
