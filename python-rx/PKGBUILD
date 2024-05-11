# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ilya Elenskiy <elenskiy.ilya@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python-rx
pkgver=3.2.0
pkgrel=6
pkgdesc='Reactive Extensions for Python'
arch=(any)
url=http://reactivex.io
license=(MIT)
depends=(python)
makedepends=(
  git
  python-setuptools
)
checkdepends=(
  python-coverage
  python-pytest
  python-pytest-asyncio
)
_tag=5054de8874f275ed0de55007b87cff4817b1d9f7
source=(
  git+https://github.com/ReactiveX/RxPY.git#tag=${_tag}
  python-rx-py311.patch
)
b2sums=('67ca5ac62ee2d95d8e1a9a1f9b5af74e362a7c28f6778e945f134f884bc1e0d4aeca80a6c2ca9721c7cdc4e3f7d57149c5ba9798a7203b471e3ea54a5e679e4c'
        '3062891dcdfec9ad21ec6815aa1f83ad6b898de32339c02cef9369a975719a1d58ab7bb07cc352829264b20bfd9a710905c96cc3b88c31b157ba1336dc77271d')

pkgver() {
  cd RxPY
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd RxPY
  # Remove deprecated loop parameter (#575)
  # https://github.com/ReactiveX/RxPY/pull/575
  git format-patch -1 --stdout 246eabfefd17 | patch -Np1
  patch -Np1 -i ../python-rx-py311.patch
}

build() {
  cd RxPY
  python setup.py build
}

check() {
  cd RxPY
  python -m pytest
}

package() {
  cd RxPY
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-rx/
}

# vim: ts=2 sw=2 et:
