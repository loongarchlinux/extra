# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-ini2toml
pkgver=0.13
_commit=ed8c5f15930e503e4598e89d5f1b053315330543
pkgrel=1
pkgdesc="Automatically conversion of .ini/.cfg files to TOML equivalents"
url="https://github.com/abravalheri/ini2toml"
license=('MPL')
arch=('any')
# The default installation is broken. Adding [full] flavor dependencies here.
depends=('python-packaging' 'python-setuptools' 'python-configupdater' 'python-tomlkit')
makedepends=('git' 'python-setuptools-scm')
checkdepends=('python-pytest-randomly' 'python-tomli-w' 'python-validate-pyproject')
source=("git+https://github.com/abravalheri/ini2toml.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd ini2toml
  sed -i 's/--cov ini2toml --cov-report term-missing//' setup.cfg
}

build() {
  cd ini2toml
  python setup.py build
}

check() {
  cd ini2toml
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # TODO
  PYTHONPATH="$PWD/tmp_install$site_packages:$PYTHONPATH" pytest --deselect tests/test_cli.py::test_auto_formatting
}

package() {
  cd ini2toml
  python setup.py install --root="$pkgdir" --optimize=1
}
