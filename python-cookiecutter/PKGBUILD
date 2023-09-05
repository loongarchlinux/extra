# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cookiecutter
pkgname=python-cookiecutter
pkgver=2.3.0
pkgrel=1
pkgdesc="A command-line utility that creates projects from project templates"
arch=(any)
url="https://github.com/cookiecutter/cookiecutter"
license=(BSD)
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
sha512sums=('f1930ce79781119ea12e18dd1dfb05777989bc121a3292294314f4320e124ac62945120f85c7a720b6bd475acb07b162fb247486855e6180449eb50c8c5ee93c')
b2sums=('9515ae58271c61a040b176fbede49bed198343a51a136509933ced4712252f359a1027e9fe5797a1ab0e37cdaaa962ad4a65927ddfd4514641f87bfb9507e566')

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
