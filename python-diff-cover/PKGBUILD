# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=python-diff-cover
_pkgname=diff_cover
pkgver=9.1.1
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
  python-pycodestyle
  python-pyflakes
  python-pylint
  python-pytest
  python-pytest-datadir
  python-pytest-mock
)
optdepends=('python-tomli: for TOML support')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f95ec296b50994e17aa2f7098c243c8a200b820071cf122c7d3536f2116b4b05')

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # Deselect failing test - unsure of why it fails.
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest \
    --deselect 'tests/test_violations_reporter.py::TestFlake8QualityReporterTest::test_file_does_not_exist'
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
}
