# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-docstring-to-markdown
_name=${pkgname#python-}
pkgver=0.15
pkgrel=2
pkgdesc='On the fly conversion of Python docstrings to markdown'
arch=('any')
url=https://github.com/python-lsp/docstring-to-markdown
license=('LGPL-2.1-or-later')
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
b2sums=('2dec8c3a233af1841f647861182ba2051e3cc65a61fd4ef3c70063348445c3ddc6951ce671b7190e1a4cdb6f67a762dd06bb2fa32ace85b34f00a17e42475fe8')

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
