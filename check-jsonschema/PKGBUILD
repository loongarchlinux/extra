# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=check-jsonschema
pkgver=0.27.3
pkgrel=1
pkgdesc="A JSON Schema CLI and pre-commit hook built on jsonschema"
arch=(any)
url="https://github.com/python-jsonschema/check-jsonschema"
license=(Apache-2.0)
depends=(
  python
  python-click
  python-importlib-resources
  python-jsonschema
  python-referencing
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
  python-regress
  python-responses
)
optdepends=(
  'python-json5: for JSON5 support'
)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('edc4ac65a13acd1a29c0ccf6498d3e6269d4509a72fde2ae5527a3c9236e3d2dbb4ba10cb47c0e228ac79b11dc73b1c80aa71b38f090c9eabf970fef0293993a')
b2sums=('cf5a3d71a696bd3de6b10771d6379f1e943e0d5b0f7d8b2640cfa60d513c79bfe2485e4aeb8df8b803de24e1b3455360f0e6c80cf09c9da7b036a58f33a5000f')

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
