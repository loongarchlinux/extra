# Maintainer: David Runge <dvzrv@archlinux.org>

_name=dep-logic
pkgname=python-dep-logic
pkgver=0.2.0
pkgrel=2
pkgdesc="Python dependency specifications supporting logical operations"
arch=(any)
url="https://github.com/pdm-project/dep-logic"
license=(Apache-2.0)
depends=(
  python
  python-packaging
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  python-pytest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('a58cd7b6a08de8e56fcb03aad13ac4ce864a650066de802268b1bb6f1c97835d3197feed982666cbc6113104a6b5aa0782adc8bd6fed9ed8723eb040206442f9')
b2sums=('d4fa7536507be6b941bf5588d2672d9a23004db4b0c266e4db66b63b1aa235445d967e402aa39c6030811c71a6156d6ad6a6017082160b54d30472e3e8dd4c04')

build() {
  cd $_name-$pkgver
  PDM_BUILD_SCM_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
