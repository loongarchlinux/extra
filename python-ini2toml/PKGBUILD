# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-ini2toml
pkgver=0.14
pkgrel=1
pkgdesc="Automatically conversion of .ini/.cfg files to TOML equivalents"
url="https://github.com/abravalheri/ini2toml"
license=('MPL')
arch=('any')
# The default installation is broken. Adding [full] flavor dependencies here.
depends=('python-packaging' 'python-setuptools' 'python-configupdater' 'python-tomlkit')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-randomly' 'python-tomli-w' 'python-validate-pyproject')
source=("git+https://github.com/abravalheri/ini2toml.git#tag=v$pkgver")
sha512sums=('7828b2a042d4510bc30e9037d897f56844ce6953c1d7dfbc51285cf28f274a9bdde8804242486f036fef3a4b32b518533c64a293c1e3e0efcc104d2f0cfb5238')

prepare() {
  cd ini2toml
  sed -i 's/--cov ini2toml --cov-report term-missing//' setup.cfg
}

build() {
  cd ini2toml
  python -m build --wheel --no-isolation
}

check() {
  cd ini2toml
  python -m venv --system-site-packages local-env
  local-env/bin/python -m installer dist/*.whl
  # TODO
  local-env/bin/python -m pytest --deselect tests/test_cli.py::test_auto_formatting
}

package() {
  cd ini2toml
  python -m installer --destdir="$pkgdir" dist/*.whl
}
