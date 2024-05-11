# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Nicolás de la torre <ndelatorre@gmail.com>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Jens Maucher <defcon@archlinux.us>

pkgname=python-rope
pkgver=1.12.0
pkgrel=2
pkgdesc='Refactoring library'
arch=('any')
url='https://github.com/python-rope/rope'
license=('LGPL-3.0-or-later')
depends=('python-pytoolconfig')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/r/rope/rope-$pkgver.tar.gz")
sha256sums=('93a1bb991fbf0426e8d415102d1c092ccc42e826ce9a42c4d61ce53d7786d9d9')

build(){
  cd "rope-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "rope-$pkgver"
  python -m unittest
}

package() {
  cd "rope-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
