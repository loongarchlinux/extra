# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-settings
pkgname=python-pydantic-settings
pkgver=2.2.1
pkgrel=2
pkgdesc="Settings management using pydantic"
arch=(any)
url="https://github.com/pydantic/pydantic-settings"
license=(MIT)
depends=(
  python
  python-dotenv
  python-pydantic
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-pytest-examples
  python-pytest-mock
)
optdepends=(
  'python-pyyaml: for YAML support'
  'python-tomlkit: for TOML support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('a90b92e85f6722321c90c0c09bd332d9ec9550c42f2c8b797bfd212532699e4d6536eec19ef172ead0aaa25fd4ef984f6694d8c957852f59ab2d45be4e29c199')
b2sums=('34827b21a916164439c060ce84d5459afaa1ebb90e7a34ea9cdbf6f6d55714f5f9a014f6ffad6832e4c80456cc520e89761dcbd9bfe14923ca04685ceaaceea5')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
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
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
