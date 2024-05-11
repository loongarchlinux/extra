# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-ruff
pkgver=0.3.2
pkgrel=1
pkgdesc="Pytest plugin to check ruff requirements"
url="https://github.com/businho/pytest-ruff"
license=('MIT')
arch=('any')
depends=('python' 'python-pytest' 'python-ruff')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core'
             'python-poetry-dynamic-versioning')
checkdepends=('python-pytest-mock')
source=("git+https://github.com/businho/pytest-ruff.git#tag=v$pkgver")
sha512sums=('07cc4bdf18a8d1ad5b3a7e218adab64586e097a1f73de8baa0662fab45cfe60d0fb3ec7c055e2d9666f6714577208529ccd0a541b3c391c6f84f8be8d5c7de9d')

build() {
  cd pytest-ruff
  python -m build -nw
}

check() {
  cd pytest-ruff
  python -m installer -d tmp_install dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages" \
    pytest
}

package() {
  cd pytest-ruff
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
