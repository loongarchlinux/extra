# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-bdd
pkgver=7.1.2
pkgrel=2
pkgdesc='BDD library for the pytest runner'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-bdd'
depends=('python-mako' 'python-packaging' 'python-parse' 'python-parse-type' 'python-pytest'
         'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-setuptools')
source=("https://github.com/pytest-dev/pytest-bdd/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7630b119649502e36d7ae2b6027c11b667513eab451511104076617e50de1456ee4b2ff128254ac0db630556258704e21e2a5e73ce9afc20ed403d0186c0a226')

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
