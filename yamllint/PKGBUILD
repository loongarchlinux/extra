# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=yamllint
pkgver=1.32.0
pkgrel=1
pkgdesc='Linter for YAML files'
arch=('any')
url=https://github.com/adrienverge/yamllint
license=('GPL3')
depends=('python-pathspec' 'python-yaml')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d01dde008c65de5b235188ab3110bebc59d18e5c65fc8a58267cd211cd9df34a')
b2sums=('68dc6fb6b0f030a32d824a09fcb122de6d0f86cfa2b1325161395c7f6277cb074fc2a4c282c56a0bfd598ddf3efd56f4c8dd497546ea75cce5bdb3c7aa5f7431')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m unittest discover tests
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
