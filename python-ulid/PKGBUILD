# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-ulid
pkgver=2.2.0
pkgrel=2
pkgdesc="ULID implementation for Python"
arch=(any)
url="https://github.com/mdomke/python-ulid"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-hatch-fancy-pypi-readme
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-freezegun
  python-pytest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('7d850cb2dfff32dd411a6cb5589eb744764fee16f37398448974352804d6d87d5fa3ca3a2371234ad8e8e761ca9a21df8e7e06fc00d7e254ed8d82609bae6775')
b2sums=('31f26ed9eff814c52b62a8bdd3740f44d16b30d97f9eb962d08a44c0e96dab1106d4d9128b77f0fcfb95e7e991c50e600d19b8a15e00f872f2f7975c503895c0')

build() {
  cd $pkgname-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
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
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
