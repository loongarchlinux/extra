# Maintainer: David Runge <dvzrv@archlinux.org>

_name=diff_cover
pkgname=python-diff-cover
pkgver=8.0.2
pkgrel=1
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
  python-tomli
)
optdepends=('python-tomli: for TOML support')
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('643291dc5091232eee1d04ddbdb24bfe3565e9cda2fc2a69d5af9100f5966c7105c3b403728bd986d10c1aabd1062e8b780defe6d4f214c41d7a4870438ef878')
b2sums=('eacf8d10ff5efc0a22e5d3782cb40e3d43e32bf47165ea6c46f24c3bcbacbfc3dd94ce827bb7f8a52d19012133002ab97405a837452f15a20e6a6d0d88295c61')

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
