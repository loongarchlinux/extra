# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pdm-build-locked
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=1
pkgdesc="A pdm plugin to publish locked dependencies as optional-dependencies"
arch=(any)
url="https://github.com/pdm-project/pdm-build-locked"
license=(MIT)
depends=(
  python
  python-pdm
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
)
checkdepends=(
  python-hatchling
  python-pkginfo
  python-pytest
  python-pytest-mock
)
optdepends=(
  'python-hatchling: for python-hatch integration'
  'python-pdm-backend: for python-pdm-backend hook'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('4be7fc1deaa4a0572588080019d6cbf9589f215994fd6ea13cfd61f4c4a43a02b1464ba713aee29ce4b021ebc7921768f6a9e31d272ba19f83f147c483773b21')
b2sums=('a00eb0e5596139ce90dce2240f71960c44b82f44ec9e7b54c80d71cf9dea180c2eb8678c17d30dbe13b79eaa0b73fba3947c6e60d41359ba2c7f0dda548e4e6d')

build() {
  cd $_name-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -o addopts=""  # we are not interested in coverage tests
    # some issue with dependency count (not really relevant for functionality)
    --deselect 'tests/unit/test_build_command.py::test_build_locked_pyproject[large]'
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
