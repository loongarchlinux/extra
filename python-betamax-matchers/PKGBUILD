# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-betamax-matchers
pkgver=0.4.0
pkgrel=11
pkgdesc="Experimental set of Matchers for Betamax that may possibly end up in the main package"
arch=('any')
license=('Apache-2.0')
url='https://github.com/betamaxpy/betamax_matchers'
depends=('python-requests-toolbelt' 'python-betamax')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/betamaxpy/betamax_matchers/archive/$pkgver.tar.gz")
sha512sums=('202255d9895b118d03efa20aa64f5b099045750dcb9a1ad3eda164d3da372207f1bee8a40f63cdf179da90cfc4380e5a004e5f9c94f006a6f3dbc64e29766c86')

build() {
  cd betamax_matchers-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd betamax_matchers-$pkgver
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd betamax_matchers-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
