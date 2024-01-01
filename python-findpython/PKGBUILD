# Maintainer: David Runge <dvzrv@archlinux.org>

_name=findpython
pkgname=python-findpython
pkgver=0.4.1
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
sha512sums=('a501b9a2f765da440cfe9dd1db18b4818fb8414ca8cbd098bc68122c7b97a98800f72ef6bec5e2a23d04aa7888f1a6b0a758b40a0f81d24308ae65e181da2cf2')
b2sums=('1bc589b1ed21f4c938bf7c827b6513d3ed120a27f52e7e6a92ab6f88dec230b6a458845a786bde8a6e2d0f2894c8c64168e3ec5956f28f5669fde9189518fe2e')

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
