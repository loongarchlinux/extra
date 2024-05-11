# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Sven Klomp <mail@klomp.eu>

pkgname=python-gnupg
pkgdesc="A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
pkgver=0.5.2
pkgrel=2
arch=(any)
url="https://github.com/vsajip/python-gnupg/"
license=(BSD-3-Clause)
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
sha512sums=('9ccfb1dad7895cd08b86f9d220a58d67d83a8acead830364d51d49733d442e7d36e8b68541f3f867a4f11c964293b084a316c1caeb45165af2882b8603742846'
            'SKIP')
b2sums=('c753004e60c16d9c098074b44f1d0b71e35544b478fbd90bfce0e50ab72b8581229d540ea612327b1fde0bcb247782daf4c39c51efe4de3360faeadc13a22f80'
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
