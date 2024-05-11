# Maintainer: David Runge <dvzrv@archlinux.org>

_haystack_name=django-haystack
_django_haystack_pkgver=3.2.1
pkgname=python-xapian-haystack
_name="${pkgname#python-}"
pkgver=3.1.0
pkgrel=2
pkgdesc="Xapian backend for Django-Haystack"
arch=(any)
url="https://github.com/notanumber/xapian-haystack"
license=(GPL-2.0-only)
depends=(
  python
  python-django
  python-django-haystack
  python-filelock
  python-xapian
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  python-$_haystack_name-$_django_haystack_pkgver.tar.gz::https://github.com/django-haystack/django-haystack/archive/refs/tags/v$pkgver.tar.gz
)
sha512sums=('dec3855ff28548dafd1f09ff7bd42f61b2392ff2eedac1d44090e186745c063991a8d2bd699778dde4ef1f21ccebcffab9aba0ac9197342048da3a20539cc467'
            '3d7dc23bf9a65062626f2860da009fdffb7cdd81cbed4f521ff00047f4d96f25702ffab032bf5d8605502b1825f1c82f867ea796583b7bf0c94ef96699a00135')
b2sums=('7a67058a8fa15222f5a9d3a251db3ea8f3866d0a4d6632382e1eef077a7105761d526d9035334d02c80557c8595ed60605d9b7c529726369150a7c79b36e519b'
        'cfdeec43014955c7b2e9ac988691c3102a752c75f3b87a57d20360c0e57db92afaff20413510f8405f0a3c8b246532aa54c3e9b1953ea32e10bc252dc3793f0f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  # inserting xapian-haystack tests into django-haystack (because... pain)
  ln -sv "$PWD/build/lib/xapian_backend.py" ../$_haystack_name-$_django_haystack_pkgver/haystack/backends/
  cp -rv "$PWD/tests/"* ../$_haystack_name-$_django_haystack_pkgver/test_haystack/
  ln -svf "$PWD/tests/xapian_tests/__init__.py" ../$_haystack_name-$_django_haystack_pkgver/test_haystack/

  cd ../$_haystack_name-$_django_haystack_pkgver
  PYTHONPATH="$PWD:$PYTHONPATH" django-admin test test_haystack.xapian_tests --settings=test_haystack.xapian_settings
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
