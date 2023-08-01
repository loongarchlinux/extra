# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Sven Klomp <mail@klomp.eu>

pkgname=python-gnupg
pkgdesc="A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
pkgver=0.5.1
pkgrel=1
arch=(any)
url="https://github.com/vsajip/python-gnupg/"
license=(BSD)
depends=(
  gnupg
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz{,.asc})
sha512sums=('7be68c2f8aad0e0923fd27e53bbbfaea8fe7b3816ff231ab6a06a52efd3a4a594af27355abcf0a453e1d0556ad8c02e960ff7c84cb0ce7d053a1adc91131eea0'
            'SKIP')
b2sums=('bc17b2a21b44c2238ad528951ddcc43d4f607cace7bf9656329dfdba360090da5efe90425c0d3ff9e9d3c42655b996a3a5a31a1f90524457fe047ab46b272e27'
        'SKIP')
validpgpkeys=('CA749061914EAC138E66EADB9147B477339A9B86') # Vinay Sajip (CODE SIGNING KEY) <vinay_sajip@yahoo.co.uk>

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  export NO_EXTERNAL_TESTS='true'
  pytest -vv
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
