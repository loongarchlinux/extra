# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-dbusmock
pkgver=0.30.0
pkgrel=1
pkgdesc="Mock D-Bus objects for tests"
url="https://github.com/martinpitt/python-dbusmock"
arch=(any)
license=(LGPL3)
depends=(
  python-dbus
  python-gobject
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
_commit=6368b5f5c206377e187b75e36fdf73f62293c551  # tags/0.30.0^0
source=(
  "git+https://github.com/martinpitt/python-dbusmock#commit=$_commit"
)
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  cd $pkgname

  # Suppress local version
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver%%+*}"

  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set sw=2 sts=-1 et:
