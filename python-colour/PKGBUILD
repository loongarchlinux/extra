# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: farwayer <farwayer@gmail.com>

pkgname=python-colour
_pyname=colour
pkgver=0.1.5
pkgrel=13
pkgdesc="Colour representations manipulation library (RGB, HSL, web, ...)"
arch=('any')
url="https://github.com/vaab/colour"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
	"drop-d2to1-requirement.patch")
sha256sums=('af20120fefd2afede8b001fbef2ea9da70ad7d49fafdb6489025dae8745c3aee'
            'aa9ce054a5fb5d97368d8cee789dab43b3ed8a44e133429dab236101770b9c48')

prepare() {
  cd $_pyname-$pkgver
  patch -Np1 -i ${srcdir}/drop-d2to1-requirement.patch
}

build() {
  cd $_pyname-$pkgver
  python setup.py build
}

check() {
  cd $_pyname-$pkgver
  pytest --doctest-modules
}

package() {
  cd $_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
