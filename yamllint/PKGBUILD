# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=yamllint
pkgver=1.33.0
pkgrel=1
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
b2sums=('SKIP')

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
