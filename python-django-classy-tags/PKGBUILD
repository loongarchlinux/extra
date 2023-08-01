# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-classy-tags
pkgname=python-django-classy-tags
pkgver=4.1.0
pkgrel=1
pkgdesc="Class based template tags for django"
arch=(any)
url="https://github.com/django-cms/django-classy-tags"
license=(BSD)
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
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('3f5696d2752648f390e647a81d78383c61b2d22f6f4dd73cf9d03ddc5c0f8223993b6ef0aba11106596c6ff8c362a14d911f44e813c6040e36fc8aa71e27da08')
b2sums=('910a267b1d781a14a1bc51c5be007c297ed26805b8a3ba2e564f38b66c8d15189a2cafccb052658e109b83b8031478a433d030fc53c97057b4a8f870355641dd')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="$PWD/build/lib:$PYTHONPATH"
  python tests/settings.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
