# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chris Warrick <aur@chriswarrick.com>

pkgname=twine
pkgver=5.0.0
_commit=94f810c54c8bc9d418a9ed64890ca9fa4ec7b59f
pkgrel=3
pkgdesc='Collection of utilities for interacting with PyPI'
arch=('any')
url='https://github.com/pypa/twine/'
license=('Apache-2.0')
depends=('python-pkginfo' 'python-readme-renderer' 'python-requests' 'python-requests-toolbelt'
         'python-urllib3' 'python-importlib-metadata' 'python-keyring' 'python-rfc3986'
         'python-rich')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('git' 'python-munch' 'python-jaraco.envs' 'python-portend' 'python-pretend'
              'python-pytest-services' 'python-pytest-socket')
provides=('python-twine')
conflicts=('python-twine')
replaces=('python-twine')
source=("git+https://github.com/pypa/twine.git#commit=$_commit")
sha512sums=('0b98ce43cc5f9b9828c38a83b91468f6c9d7d8dc29d6d929586ed77cfd763dd840bffc4f431f6671040eab654a22de9053b1058affb613f2c64e8ba159b43f93')

prepare() {
  cd $pkgname
  # Fix metadata tests
  git cherry-pick -n 9eb9269e8c0ab0f53010a4b7b6cf466fd6f0090f
}

build() {
  cd $pkgname
  python -m build -nw
}

check() {
  cd $pkgname
  # Ignored tests are copied from upstream tox.ini:
  # https://github.com/pypa/twine/blob/4.0.2/tox.ini#L16
  python -m pytest --ignore-glob '*integration*.py'
}

package() {
  cd $pkgname
  python -m installer -d "$pkgdir" dist/*.whl
  ln -s twine "$pkgdir"/usr/bin/twine3
}
