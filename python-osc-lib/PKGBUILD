# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-osc-lib
pkgver=3.0.1
_commit=73ecaa7425214cf61e5f35b69178619a1579f73c
pkgrel=2
pkgdesc="OpenStackClient Library"
arch=('any')
url="https://docs.openstack.org/osc-lib/latest/"
license=('Apache')
depends=('python-pbr' 'python-cliff' 'python-keystoneauth1' 'python-openstacksdk' 'python-oslo-i18n'
         'python-oslo-utils' 'python-simplejson' 'python-stevedore')
makedepends=('git' 'python-setuptools')
checkdepends=('python-oslotest' 'python-requests-mock' 'python-stestr' 'python-testrepository'
              'python-testtools')
source=("git+https://github.com/openstack/osc-lib.git#commit=$_commit")
sha512sums=('92bf3060f0937683b086a12baebe58a1d78728121a1e31301f6a0ee9121305b01f7100a2e2974740081ac19074c86a92335fcc23438878b1b572b9f865d632e9')

build() {
  cd osc-lib
  python setup.py build
}

check() {
  cd osc-lib
  stestr run
}

package() {
  cd osc-lib
  python setup.py install --root="$pkgdir" --optimize=1
}
