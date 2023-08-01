# Maintainer: David Runge <dvzrv@archlinux.org>

_name=findpython
pkgname=python-findpython
pkgver=0.3.1
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
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('a9931cd305a12302753fc74be24f845242ac1d4a0b0bc4494dfaec4a32cb1edc88cc30f0924b24109db01409e20a4aa8dc3c3e3136cc8e780b00cd3a0eeb9816')
b2sums=('73be0b8c064f0417c7023b367328c2694e74de4559acd48cf9faac8cb73b1450c15269b0078bc20392275cb032e57615e2345e9b72b5623262816f2ea3901aa0')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
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
