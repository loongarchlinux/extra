# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-docstring-to-markdown
_name=${pkgname#python-}
pkgver=0.13
pkgrel=1
pkgdesc='On the fly conversion of Python docstrings to markdown'
arch=('any')
url=https://github.com/python-lsp/docstring-to-markdown
license=('LGPL2.1')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("git+$url.git#tag=v$pkgver")
b2sums=('SKIP')

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"
  PYTHONPATH="$PWD/$_name:$PYTHONPATH" pytest -c /dev/null --pyargs tests
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
