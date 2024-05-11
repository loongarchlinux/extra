# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=python-curtsies
_pkgname=curtsies
pkgver=0.4.2
pkgrel=3
pkgdesc="Curses-like terminal wrapper with a display based on compositing 2d arrays of text"
arch=('any')
url="https://pypi.python.org/pypi/curtsies"
license=('MIT')
depends=('python-blessed' 'python-cwcwidth')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/c/curtsies/curtsies-$pkgver.tar.gz")
sha256sums=('6ebe33215bd7c92851a506049c720cca4cf5c192c1665c1d7a98a04c4702760e')

prepare() {
  # 0.3.0 bug?
  cd "$srcdir/curtsies-$pkgver"
  sed -i 's/^.*typing.*$//' curtsies.egg-info/requires.txt setup.py
}

build() {
  cd "$srcdir/curtsies-$pkgver"
  python3 setup.py build
}

package() {
  cd "$srcdir/curtsies-$pkgver"
  python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=0
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-curtsies/LICENSE"
}
