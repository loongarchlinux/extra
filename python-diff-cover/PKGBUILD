# Maintainer: David Runge <dvzrv@archlinux.org>

_name=diff_cover
pkgname=python-diff-cover
pkgver=8.0.1
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
sha512sums=('c1642c1d340003bcdf05084f52a24677f4506bee4f42cb014783b7a5d4ad7de833fea8d8d35b7d3cde74801236ef6f0982bfb410cf11310d22787569848c9978')
b2sums=('756eb4bdbfe1cc3e81b5bca3ac1c991c9d0842592657e92d329230775076d73db1382a864a5257ca244c435dfee2d44256abff76ff09bd561e82eacf941659a5')

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
