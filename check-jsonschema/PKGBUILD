# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=check-jsonschema
pkgver=0.24.1
pkgrel=1
pkgdesc="A JSON Schema CLI and pre-commit hook built on jsonschema"
arch=(any)
url="https://github.com/python-jsonschema/check-jsonschema"
license=(Apache)
depends=(
  python
  python-click
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
  python-responses
)
optdepends=(
  'python-json5: for JSON5 support'
)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('7d0f9db1f54c161b2620e6044b0010db5957313fd9faccaadeb190b5ceeb6477379b6ec21898b0ca8715d866c00ae63dbd897744127a0c35ed16418f55c74448')
b2sums=('1b1080af70cb4df0f0cd62517623136cece6c5c49407dab591bd99f8911f602df314111f221a77df8d718f067b0b713b6c9850e4a2bd01c74227ece0e470969e')

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
