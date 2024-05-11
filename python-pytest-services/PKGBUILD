# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-services
pkgname=python-pytest-services
pkgver=2.2.1
pkgrel=10
pkgdesc="Services plugin for pytest testing framework"
arch=(any)
url="https://github.com/pytest-dev/pytest-services"
license=(MIT)
depends=(
  python
  python-pytest
  python-requests
  python-psutil
  python-zc.lockfile
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  memcached
  python-astroid
  python-coverage
  python-mysqlclient
  python-pylibmc
  xorg-server-xvfb
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('95d70431a7c3fa3b1602e6ad0e72975cecf5f0464e1bbc21d5b4eee6aefee52794c7b1d8dacf0681cc4cbb5ae7910075a7d0b3859647cc55298a2792489c4bfb')
b2sums=('6f4b66b713ca4976eae61bf516bfecf13b8d6f56e03ae772ba9465e7c4c52b8d5ffa713b9441c73538a0b05665da7b7aa53d5f5da1626c6c208edf1c8239b1b1')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="tmp_install" dist/*.whl
  export PYTHONPATH="$PWD/tmp_install/$_site_packages/:$PYTHONPATH:$PWD/tests"
  pytest -vv -k 'not test_mysql'
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CHANGES,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
