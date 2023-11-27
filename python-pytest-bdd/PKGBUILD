# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-bdd
pkgver=7.0.0
pkgrel=1
pkgdesc='BDD library for the pytest runner'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-bdd'
depends=('python-mako' 'python-parse' 'python-parse-type' 'python-pytest' 'python-typing-extensions')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-setuptools')
source=("https://github.com/pytest-dev/pytest-bdd/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0f95334a56ff7ccc774e5b94b91d232b829fb308a21ce975c88720493abbefa9e76fcd35cc2ca9bbbf0fd2e38b6f20f5be6cf59368aab4cf70abdaf24c7fd5ed')

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
