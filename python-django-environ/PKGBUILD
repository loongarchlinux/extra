# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-environ
pkgname=python-django-environ
pkgver=0.11.2
pkgrel=1
pkgdesc="Utilize 12factor inspired environment variables to configure your Django application"
arch=(any)
url="https://github.com/joke2k/django-environ"
license=(MIT)
depends=(
  python
  python-django
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=('python-simplejson: for an alternative JSON implementation')
source=($url/releases/download/v$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('d024858514b2a6edd99a7a2f1ae26e9e7cc007b1454a1c3f2cd2ae061b4e961f16c4acc8c77ee6449e4b11b3d98c72aae849e337339cb5e275b85077a02b59d0')
b2sums=('bcd53d13b2b936ba499e1481a46101d54b35f79f83584aa447fc222503e19da41545e7281cb6287351350250c4b728d50ef2be797dabf17672799f02976d3e1e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
