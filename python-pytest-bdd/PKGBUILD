# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-bdd
pkgver=7.0.1
pkgrel=1
pkgdesc='BDD library for the pytest runner'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-bdd'
depends=('python-mako' 'python-parse' 'python-parse-type' 'python-pytest' 'python-typing-extensions')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-setuptools')
source=("https://github.com/pytest-dev/pytest-bdd/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('60d9713485a4719c6589e6641b45045e79c063278359c14ccbd016a6b0a8c8eebbf93e61d59e037988247c0116023910aa5e6776896b64dc96dcc23d0dbf6e3b')

prepare() {
  cd pytest-bdd-$pkgver
  # Do not treat warnings as errors
  sed -i '/^    error$/d' pytest.ini
}

build() {
  cd pytest-bdd-$pkgver
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-bdd-$pkgver
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd pytest-bdd-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
