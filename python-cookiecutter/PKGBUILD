# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cookiecutter
pkgname=python-cookiecutter
pkgver=2.2.3
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
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('79cd2e7a92dd7902a3e24504f91d2481b50ab7ff326436065d178dbb7ead9a8ab157f09d1b4806d0405046dfde410f1d69562499b2f7238e16554c4e23911b87')
b2sums=('63172bbea88ad331f470e357d92ff1de87a8a9cb7c4c8bd77709cc9f121775db51742ce4fda4416f98eca99438cb174f7c8dd39936aa24f6a8280c74c99bf4b4')

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
