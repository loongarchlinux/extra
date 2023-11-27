# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.25.0
pkgrel=1
pkgdesc="Python api for tmux"
arch=(any)
url="https://libtmux.git-pull.com/"
license=(MIT)
depends=(
  python
  python-typing-extensions
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
source=($_name-$pkgver.tar.gz::https://github.com/tmux-python/libtmux/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('72cf2a24af0407baa775f1be13490c45b573cfaabc6803b57d77cc0eac5de0ef9b8c3a8923437163d1b6b9486a86b71076df40761f302d3534d36d94c68bd6bb')
b2sums=('ac9da378491acbb91eb8e67e47ef213206d77f618a35fd6cba1014435c70b82eca712f764ccc4f2fa14f4027001678e31743ade9b28ffbc9e5509e2592afab48')

prepare() {
  cd $_name-$pkgver
  # we do not want to package python-gp-libs: https://github.com/tmux-python/libtmux/issues/496
  sed '/addopts/d' -i pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    --deselect tests/test_pane.py::test_capture_pane_start
    -vv
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$_site_packages"
  pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 {CHANGES,README.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
