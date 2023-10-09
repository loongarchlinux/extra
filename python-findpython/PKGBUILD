# Maintainer: David Runge <dvzrv@archlinux.org>

_name=findpython
pkgname=python-findpython
pkgver=0.4.0
pkgrel=1
pkgdesc="A utility to find python versions on your system"
arch=(any)
url="https://github.com/frostming/findpython"
license=(MIT)
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
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('aedde450c8aa19407556f6f15123f9373b903b1ee222006704fde408316a10b871b527ccaafb864520e5f626224e0e369ded980473dc6f1d9cf3412d9a15c8b5')
b2sums=('de87f82eb8ef55c80bfeade6fd6cec2350a12b0b70409ad44434b4c4ebdced7f6910396365fbffe6dd22ff4ee66958614b150fb4abbe22f0cb58fa672c25628a')

build() {
  cd $_name-$pkgver
  PDM_BUILD_SCM_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="test_dir" dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
