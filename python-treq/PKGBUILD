# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-treq
# https://github.com/twisted/treq/blob/trunk/CHANGELOG.rst
pkgver=23.11.0
pkgrel=2
pkgdesc="A requests-like API built on top of twisted.web's Agent"
arch=('any')
license=('MIT')
url='https://github.com/twisted/treq'
depends=('python' 'python-incremental' 'python-requests' 'python-pyopenssl' 'python-service-identity'
         'python-attrs' 'python-twisted' 'python-hyperlink'
         # Used but not declared upstream
         'python-zope-interface')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'httpbin')
source=("https://github.com/twisted/treq/archive/release-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('3e5feba73127d86f7cb3b98fee391cad954cff22fa2a7b67301fd792dfc5d83fd14d4df30cc42608c1ca3bbfc0dcbee985cdebae06a65df3a8d79a19283b0b9a')

build() {
  cd treq-release-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd treq-release-$pkgver
  PYTHONPATH="$PWD/build/lib" trial treq
}

package() {
  cd treq-release-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
