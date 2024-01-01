# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=copr-cli
pkgver=1.104
pkgrel=1
pkgdesc="CLI tool to run copr"
url="https://github.com/fedora-copr/copr"
license=('GPL')
arch=('any')
depends=('python-copr' 'python-humanize' 'python-simplejson' 'python-jinja' 'python-setuptools'
         'python-future')
checkdepends=('python-pytest' 'python-responses')
source=("https://github.com/fedora-copr/copr/archive/copr-cli-$pkgver-1.tar.gz")
sha512sums=('e69777162a033eed79aec0f82c1d8a0a9428dc63bc0d383a0b0e200664f052453fec0786245c7590e96bceb56af3b9d0337ee6bb0686f90fdee421b7b827b47c')

build() {
  cd copr-copr-cli-$pkgver-1/cli
  python setup.py build
}

check() {
  cd copr-copr-cli-$pkgver-1/cli
  python -m pytest
}

package() {
  cd copr-copr-cli-$pkgver-1/cli
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 man/*.1 -t "$pkgdir"/usr/share/man/man1/
}
