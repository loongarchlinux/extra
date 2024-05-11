# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl.i18n
pkgname=python-flufl.i18n
pkgver=5.1.0
pkgrel=2
pkgdesc="A high level API for internationalization"
arch=(any)
url="https://gitlab.com/warsaw/flufl.i18n"
license=(Apache-2.0)
depends=(
  python
  python-atpublic
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-sybil
  python-pytest
)
provides=(python-flufl-i18n)
replaces=(python-flufl-i18n)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('351d81b0c2db75dbb1eaa18ea1c1522ad70048ca54724594ec58f10262578915441eede9eeeaa2a32d2fd9db3d1e26eaeca02274873f3262b6e8c41317158221')
b2sums=('27427ae20fb180f2c52976207022fbb0fc829c0895a97df381cabaa5c05ab6d364ef0eea9c214e366963b78e23badf30665f6e141f552c0731459a96a99c372b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -o addopts=''
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
