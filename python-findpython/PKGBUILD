# Maintainer: David Runge <dvzrv@archlinux.org>

_name=findpython
pkgname=python-findpython
pkgver=0.6.1
pkgrel=2
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
sha512sums=('ec6bb95fe19f3b1c5408c91948dc8b9aaa4516c664d5a810bff80a658b03df0d40b1e077b170b247293ccc0375156b9c010632b07dac57d435cb5d006ac4b6e6')
b2sums=('a74e91d2fd4f2cc46c4311f3f9ab6a4aa9e42f0c1b020dbb76d403363fae8e208195024f2df255e58cf46b5fb686ebeded9b80c716c7158a21f39f1684c3bbf8')

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
