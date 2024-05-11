# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nose2
pkgname=python-nose2
pkgver=0.14.2
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
sha512sums=('2f6317bc45177194f62b0e664bd6dcba50c8c8f593500edd8b4562a6bc784ceb52d931cc296869673d15142aceaeb1267a4edfdb5e14e3007eac035e6e18a3db')
b2sums=('ffca99154594c373e36d053429ab09ac705a7a9db172cbd5645e89d96367b37b7a83de774fbda0c6a3eba996a6d39239a79d1e6bd6d5252114cb3bf7ce0a8a06')

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
