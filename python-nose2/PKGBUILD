# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nose2
pkgname=python-nose2
pkgver=0.15.1
pkgrel=1
pkgdesc="The next generation of nicer testing for python"
arch=(any)
url="https://github.com/nose-devs/nose2"
license=(
  BSD-2-Clause
  BSD-3-Clause
)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-coverage
)
optdepends=(
  'python-coverage: for coverage_plugin'
  'python-setuptools: for eggdiscovery plugin'
  'python-sphinx: for doc'
  'python-sphinx_rtd_theme: for doc'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('88a22cafb4516c4c86d81bd68710d49e018614d1512a030fe07bffe57cf364c780050d98a64ea1c69b5bdb1ef8ad69dab5ad1199192ddd2bf6568dca040aee77')
b2sums=('f388fb354f1c783d57c14abd05958b5087c8201721fd63223aa056fc3fd83571801ec100dd21d4b7341654511620457d31701a6c47f6b38dc4b178c5c1326925')

prepare() {
  sed -n '1,27p' $_name-$pkgver/LICENSE > BSD-2-Clause.txt
  sed -n '34,65p' $_name-$pkgver/LICENSE > BSD-3-Clause.txt
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location to be able to run tests with nose2 itself
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  export PATH="$PWD/test_dir/usr/bin:$PATH"
  nose2 -v --start-dir test_dir/$site_packages/$_name/tests/unit
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 ../BSD-{2,3}-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
