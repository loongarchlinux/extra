# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

_name=pytest-xprocess
pkgname=python-pytest-xprocess
pkgver=0.23.0
pkgrel=1
pkgdesc='Pytest plugin to manage external processes across test runs.'
arch=(any)
url="https://github.com/pytest-dev/pytest-xprocess"
license=(MIT)
depends=(
  python
  python-psutil
  python-py
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('80b577257413ed1bc4e7799d9c6b90f05a7ff318c273a9c7be902bc996cb99e383ad93e145eb1eabdff23a0d47b7c26174e81fd1933753f53de81816798a05ed')
b2sums=('a0494be4d5fd7a8600f7b496dad6d3beefb81e56ff30796d36b8514bf2da74bd014c5bbe757081dfec6cbdc4360425231cf66d6a73565097fbd4c17b10011030')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  # issues with some tests at least since 0.18.1: https://github.com/pytest-dev/pytest-xprocess/issues/95
  pytest -vv -k "not test_interruption_cleanup and not test_interruption_does_not_cleanup"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/$pkgname/"
}
