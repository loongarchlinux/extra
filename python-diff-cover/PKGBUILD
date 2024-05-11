# Maintainer: David Runge <dvzrv@archlinux.org>

_name=diff_cover
pkgname=python-diff-cover
pkgver=8.0.3
pkgrel=3
pkgdesc="Automatically find diff lines that need test coverage"
arch=(any)
url="https://github.com/Bachmann1234/diff_cover"
license=(Apache-2.0)
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
)
optdepends=('python-tomli: for TOML support')
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('0c1e67a672e6286f63bb0ceaaecbf9df364513dfd0247a512794608ced7db021497c64109646ab993d3be288963fa17f3461c63bb1ab22df740ef1979e59586e')
b2sums=('bcb9a1b966a4d35b998e19c009bbc7b1971b76b64b9f92c064c3bde1ebc0e4e8036a3b89dd6b24f2aec98ea7403f6b40dc6ed77a9e4a0295c9d7e41313f17e62')

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
