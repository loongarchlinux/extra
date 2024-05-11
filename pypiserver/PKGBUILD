# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=pypiserver
pkgver=2.1.1
pkgrel=1
pkgdesc="Minimal PyPI server for uploading and downloading packages with pip/easy_install"
arch=(any)
url="https://github.com/pypiserver/pypiserver"
license=(
  MIT
  Zlib
)
depends=(
  python
  python-pip
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-git
  python-wheel
)
checkdepends=(
  python-httpx
  python-passlib
  python-pip
  python-pytest
  python-watchdog
  python-webtest
)
optdepends=(
  'python-passlib: for authentication'
  'python-setuptools: for new - still inactive - config module'
  'python-waitress: for waitress support'
  'python-watchdog: for cache'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('d85afb0d2c85c76a62e393d7d7824e91ff052a04e985278db48010b6f71d12c7749139245e69932b78aefbf3152ba8a8b463bfcd21d1772d047d64f0b164681a')
b2sums=('e80c73b2422dc87bba09d8c9c2e1ffc72017ec58c5530d3debb95560b50a776e1603cb5641c7e4af1ed87d64750843ae025a6a47ab4cc28ce0de1051dd5b214f')
validpgpkeys=('0BFB950A1851C0E7EE46D9BCAF5C892A5573ABED') # Matthew Planchard (2020-06-22-mininix) <msplanchard@gmail.com>

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest -vv --ignore docker/test_docker.py -k "not test_twine"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/$pkgname*.whl
  install -vDm 644 {AUTHORS,CHANGES}.rst README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
