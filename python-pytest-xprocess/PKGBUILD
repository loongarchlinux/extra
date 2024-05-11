# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

_name=pytest-xprocess
pkgname=python-pytest-xprocess
pkgver=1.0.1
pkgrel=1
pkgdesc='Pytest plugin to manage external processes across test runs.'
arch=(any)
url="https://github.com/pytest-dev/pytest-xprocess"
license=(MIT)
depends=(
  python
  python-psutil
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('44c0c496fd3c52134b4a208c61cae3e8e0620091e356eddc2b5105b85a5ca9201e54a985c9fbef2a486701dcd42616a02a5e0f86cc3c25857b874f04850613b2')
b2sums=('b38f822ccb1f903d6e9ec4150484537ffbe20116d631a874252c731e3002d01e88e254d4e4ede8965a929b1f46b2c4fcec9a00dafb7ed242e065a70cadbc35fa')

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
