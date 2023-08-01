# Maintainer: David Runge <dvzrv@archlinux.org>

_name=diff_cover
pkgname=python-diff-cover
pkgver=7.7.0
pkgrel=1
pkgdesc="Automatically find diff lines that need test coverage"
arch=(any)
url="https://github.com/Bachmann1234/diff_cover"
license=(Apache)
depends=(
  python
  python-chardet
  python-jinja
  python-pluggy
  python-pygments
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-tomli
)
optdepends=('python-tomli: for TOML support')
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('294535c947b56453e3d80caff7dddd04f989552a6823a6f294f939001e2c8b3e966a72a32b137041d26cf3d6f4f95cea2a63eb5a9eaf9d1621a3b4983d3684cb')
b2sums=('b80188010a5d95ea962c40d4d92984bdf6404666994946625111d5171f02d236799ea078e4099f498f2f6f0ee9105558f3c3a3f51d62ced1b52b404e97451d34')

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
  # ignore integration and code style checks
  pytest -vv --ignore 'tests/test_integration.py' --ignore 'tests/test_violations_reporter.py' --ignore 'tests/test_clover_violations_reporter.py'
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
