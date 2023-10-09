# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nose2
pkgname=python-nose2
pkgver=0.14.0
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
sha512sums=('ed6b245bc57b63b011883f42dbda8b2797504afa02a102c43f4e7d3c6cbfcf7e8babca23f9341c7681b75dae12c2d269ea65a583c18d4d15b999df081fc0247b')
b2sums=('c72f939f597eead3a5d8be995fc4ae1988a0c76f5599dc9e040780520055aa1002d2d93f35527e56f90609d2f4ef560161bbf695bb3751cac71007dfbd06c522')

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
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
