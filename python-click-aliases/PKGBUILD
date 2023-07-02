# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-aliases
pkgname=python-click-aliases
pkgver=1.0.1
pkgrel=2
pkgdesc="Enable aliases for click"
arch=(any)
url="https://github.com/click-contrib/click-aliases"
license=(MIT)
depends=(
  python
  python-click
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('b575a735089f039aa9d9196023a63a78b355001cb7a911f0a9774a662b140bb1658b01990b76ea072f7e4257a6c104f91cb38034c44850f64f8f2a6007c0fd2e')
b2sums=('79e39ce57111cea831d7486f6ec6bfe687fd15cbd595d5e3ad82673c1113bd3a1f06971c490110a002ded9b2a41bae65985bc166e6fdc4a95e9281b74e2201ae')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable broken tests (due to undead project): https://github.com/click-contrib/click-aliases/issues/5
    --deselect tests/test_basic.py::test_invalid
    --deselect tests/test_foobar.py::test_invalid
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
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
