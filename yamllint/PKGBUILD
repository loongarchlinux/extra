# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=yamllint
pkgver=1.33.0
pkgrel=2
pkgdesc='Linter for YAML files'
arch=('any')
url=https://github.com/adrienverge/yamllint
license=('GPL3')
depends=('python-pathspec' 'python-yaml')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('022d0b92202767d774bb7b9895c6dca72442aad7bad1152845d94000ec0299c7335bee1467835dc76c964fd19d0ef8b966b6a28489747a7246618cf2b527601b')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  python -m unittest discover tests
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
