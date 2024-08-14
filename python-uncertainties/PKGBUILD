# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-uncertainties
pkgver=3.2.2
pkgrel=1
pkgdesc="Transparent calculations with uncertainties on the quantities involved (aka error propagation); fast calculation of derivatives."
arch=('any')
license=('BSD')
url="https://github.com/lmfit/uncertainties"
depends=('python')
optdepends=('python-numpy: additional support for NumPy arrays and matrices')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-numpy')
source=("git+https://github.com/lmfit/uncertainties.git#tag=$pkgver")
sha512sums=('048200d7b7a1f2b78e3c5cdbb8e607f4e6f5c434a9218877edb62dc0cff108010f84b9c29bcc4ec575eade44838690854214374eb070fe5aae869deee9a90de8')

build() {
  cd uncertainties
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build -nw
}

check() {
  cd uncertainties
  python -m pytest
}

package() {
  cd uncertainties
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
