# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cookiecutter
pkgname=python-cookiecutter
pkgver=2.5.0
pkgrel=1
pkgdesc="A command-line utility that creates projects from project templates"
arch=(any)
url="https://github.com/cookiecutter/cookiecutter"
license=(BSD-3-Clause)
depends=(
  python
  python-arrow
  python-binaryornot
  python-click
  python-jinja
  python-pyyaml
  python-requests
  python-rich
  python-slugify
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  git
  python-freezegun
  python-pytest
  python-pytest-mock
)
source=($url/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('87ab0d21d6bb98c96cad420a52e08aeebe9a47ee34801a423339453e0099c4eb35950e0180af94dd5dd9373a0292a23c6a5c3bde23d3345c06b059da1294c374')
b2sums=('8f294d39a385909cf9c23511eae2ad28783ff8da767e31744ded45e4ce15857039d913f5449523a20945328547263f4887d73d44a951b4b29b628fc1dc25c229')

prepare() {
  # we do not care about code coverage in pytest runs
  sed -e '/addopts/d' -i $_name-$pkgver/setup.cfg
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
