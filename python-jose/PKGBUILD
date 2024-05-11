# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jose
pkgver=3.3.0
pkgrel=7
pkgdesc="A JOSE implementation in Python"
arch=('any')
license=('MIT')
url="https://github.com/mpdavis/python-jose"
depends=('python-rsa' 'python-ecdsa' 'python-future')
optdepends=('python-cryptography: one option for better performance'
            'python-pycryptodome: one option for better performance')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-cryptography' 'python-pycryptodome' 'python-pytest-cov' 'python-pytest')
source=("https://github.com/mpdavis/python-jose/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('de7147cc6e12406d6e459c32829acae46395acba727c53e65bc05f4794ee3050eecd355e3ae2e87f4ebdbd871f53822eea08a10f25d7ca6088fc6128dc7d9637')

prepare() {
  cd python-jose-$pkgver
  sed -i '/"pytest-runner",/d' setup.py
}

build() {
  cd python-jose-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd python-jose-$pkgver
  pytest
}

package() {
  cd python-jose-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
