# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cookiecutter
pkgname=python-cookiecutter
pkgver=2.4.0
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
sha512sums=('c0e1ab6bed36bc57bd56becc8d7f7f3526a7257a95ed37819a8814152f2d06fe4bd5dafab66c508be4cd14fb191fd59ffbf559513c55ff84c4b51131771bc4e6')
b2sums=('bd45803a8f232bd9453afc7f9f43170624d130b788e6cb055cfc31b3e58f097032838e65a5807c71b6ebf740e239e26b51edabaff0353152f7e8f4d008ce56d0')

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
