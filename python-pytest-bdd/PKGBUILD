# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-bdd
pkgver=7.2.0
pkgrel=1
pkgdesc='BDD library for the pytest runner'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-bdd'
depends=('python-mako' 'python-packaging' 'python-parse' 'python-parse-type' 'python-pytest'
         'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-setuptools')
source=("git+https://github.com/pytest-dev/pytest-bdd.git#tag=$pkgver")
sha512sums=('a6ed66fafc20967ae8609c95a56e98cacb6c30fcefc8b385952513f4e2f77cdc8a2ef87dc23b657fb8a8a7454ed3dee4cf0657a71e531f7f12184f6a55ccf4dc')

prepare() {
  cd pytest-bdd
  # Do not treat warnings as errors
  sed -i '/^    error$/d' pytest.ini
}

build() {
  cd pytest-bdd
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-bdd
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd pytest-bdd
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
