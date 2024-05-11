# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Antoine Pierlot-Garcin <antoine at bokbox dot com>

pkgname=python-pykka
pkgver=4.0.2
pkgrel=2
pkgdesc="Easy to use concurrency abstractions for Python using the actor model"
arch=('any')
url="http://pykka.readthedocs.org/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
optdepends=('python-gevent: Use gevent based actors from pykka.gevent')
source=("https://pypi.python.org/packages/source/p/pykka/pykka-$pkgver.tar.gz")
sha512sums=('7c2acb8ccf2039269dd8d41f9aa74981c353618ee6c7eab1e8e6af9efc9897d8b8b6ec4d7de2b98447b051cdc5bdd59d79a3f76685b7a45826e8e01d90548108')

build() {
  cd "pykka-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "pykka-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
