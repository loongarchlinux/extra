# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-ruff
pkgver=0.2.1
_commit=2098829cfb8f95c2885c6dec3e229ed3092e2c1e
pkgrel=1
pkgdesc="Pytest plugin to check ruff requirements"
url="https://github.com/businho/pytest-ruff"
license=('MIT')
arch=('any')
depends=('python' 'python-pytest' 'python-ruff')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core'
             'python-poetry-dynamic-versioning')
checkdepends=('python-pytest-mock')
source=("git+https://github.com/businho/pytest-ruff.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd pytest-ruff
  sed 's/--cov --cov-report term --cov-report xml//' -i pyproject.toml
}

build() {
  cd pytest-ruff
  python -m build -nw
}

check() {
  cd pytest-ruff
  python -m installer -d tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.11/site-packages" \
    pytest
}

package() {
  cd pytest-ruff
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
