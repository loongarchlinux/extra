# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
# Contributor: Nick Ward <ward.nickjames@gmail.com>
# Contributor: Rich Lindsley <rich at dranek dot com>

pkgname='python-patsy'
pkgver=0.5.6
pkgrel=1
pkgdesc="A Python package for describing statistical models using symbolic formulas"
arch=('any')
url="https://github.com/pydata/patsy"
license=('BSD')
depends=('python-numpy')
makedepends=('python-setuptools')
optdepends=('python-scipy: needed for spline-related functions')
source=("https://github.com/pydata/patsy/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9ecfaf3f3255687ab45df084adec2772c9fd17b9b763959b37e8732f3403b748')

build() {
  cd patsy-${pkgver}
  python setup.py build
}

package() {
  cd patsy-${pkgver}

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
