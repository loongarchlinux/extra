# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Matthew Sloan matthew@sloan.cc

pkgname=python-pint
pkgver=0.24.3
pkgrel=1
pkgdesc="A unit library for Python"
arch=('any')
license=('BSD-3-Clause')
url="https://pint.readthedocs.org"
depends=(
  'python'
  'python-appdirs'
  'python-flexcache'
  'python-flexparser'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-numpy'
  'python-pytest'
  python-pytest-benchmark
  'python-pytest-subtests'
  'python-uncertainties'
)
source=("git+https://github.com/hgrecco/pint.git#tag=$pkgver")
sha512sums=('903280809996d256c332a0568fb9a6d9317a1f762c81b7399c72a8535abec1e3ea9f158e919ef4fedb6848341b7c7c7f264657abf447eaff8a31ce20f94ac1ab')

build() {
  cd pint
  python -m build --wheel --no-isolation
}

check() {
  cd pint
  pytest
}

package() {
  cd pint
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/Pint-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
