# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.37.0
_pkgver=${pkgver/.post0/post0}
pkgrel=2
pkgdesc="Python api for tmux"
arch=(any)
url="https://libtmux.git-pull.com/"
_url="https://github.com/tmux-python/libtmux"
license=(MIT)
depends=(
  python
  python-typing_extensions
  tmux
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
  procps-ng
)
optdepends=('python-pytest: for pytest plugin')
source=($_name-$_pkgver.tar.gz::$_url/archive/refs/tags/v$_pkgver.tar.gz)
sha512sums=('8876ad13613d367d6a6ea5945b5a0a495460b5ad68a14d89d20a41f0e5b421e0007041e4e8356e88a8eefb2b2422be306aebd2452e3be556f1cc4fd232327499')
b2sums=('ef8c9c05cc20f549fc13ffb05276e1ba5b24c366c9cf44eb5ffe609cfe0e603ab7a90747b5df03afa62a6a9d8c81904e7fa7e4598092d3b11c0e9295e413d88d')

build() {
  cd $_name-$_pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    --deselect tests/test_pane.py::test_capture_pane_start
    -vv
    # we do not want to package python-gp-libs: https://github.com/tmux-python/libtmux/issues/496
    -o addopts=''
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$_pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$_site_packages"
  pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$_pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 {CHANGES,README.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
