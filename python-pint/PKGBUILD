# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Matthew Sloan matthew@sloan.cc

pkgname=python-pint
pkgver=0.23
pkgrel=2
pkgdesc="A unit library for Python"
arch=('any')
license=('BSD-3-Clause')
url="https://pint.readthedocs.org"
depends=('python')
makedepends=('python-setuptools-scm' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
checkdepends=(python-pytest-benchmark 'python-pytest-subtests' 'python-numpy' 'python-uncertainties' 'python-pytest7')
source=("https://pypi.io/packages/source/P/Pint/Pint-$pkgver.tar.gz")
sha512sums=('80abfedab0c2b959c84958ad731a8e03469991b7a3970d99e344b513237b96c764098cdfe9e11f94c4208667fd965bd1cc043d820450d45cbb6a914ee1742ac6')

build() {
  cd Pint-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd Pint-$pkgver
  # https://github.com/hgrecco/pint/issues/1898
  pytest -k 'not test_load_definitions_stage_2'
}

package() {
  cd Pint-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
