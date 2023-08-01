# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=check-jsonschema
pkgver=0.23.3
pkgrel=1
pkgdesc="A JSON Schema CLI and pre-commit hook built on jsonschema"
arch=(any)
url="https://github.com/python-jsonschema/check-jsonschema"
license=(Apache)
depends=(
  python
  python-click
  python-jsonschema
  python-requests
  python-ruamel-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-json5
  python-pytest
  python-pytest-xdist
  python-responses
)
optdepends=(
  'python-json5: for JSON5 support'
)
source=(
  # no tests in sdist tarballs
  # https://github.com/python-jsonschema/check-jsonschema/issues/258
  # https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz
  $url/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
sha512sums=('14f9eb6b203e3aec6ca35f75304bd24fd5a09c2b89bcbbf69c22e0c0f44c587972015677498fef1a378683c77f94d9319450daccadddf5fecbe7c738dd16c726')
b2sums=('a8a40ddc383f38096693a2079b73a8a8fe2ceed5d1e118e539957c205c500807518c0380aa18cae2524efdeda33987f057350ba73b7a699240706ff4e276eafc')

check() {
  # we don't support pinning
  sed -e 's/==/>=/g' -i $pkgname-$pkgver/setup.cfg
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
