# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl_i18n
pkgname=python-flufl.i18n
pkgver=5.0.2
pkgrel=1
pkgdesc="A high level API for internationalization"
arch=(any)
url="https://gitlab.com/warsaw/flufl.i18n"
license=(Apache)
depends=(
  python
  python-atpublic
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
)
checkdepends=(
  python-sybil
  python-pytest
)
provides=(python-flufl-i18n)
replaces=(python-flufl-i18n)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('9980f3df2f04237dad8861c7c03be174a9b4555375daeb49a4f2f668f305b7d2ed5cc0ef6db5692f93b66ff0e93b61c041a06cb21790c36c585bf9415eedf0a7')
b2sums=('b636d8b2feb4a9da302464f126486a5e7d4d14d3fd5cbed919272a9efd1a122e7db16a465bb3fba284ff9b6e625ec9eff99369c2972621f31898724d07e00f86')

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
  pytest -vv -c /dev/null
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
