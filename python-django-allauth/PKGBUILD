# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-allauth
pkgname=python-django-allauth
pkgver=0.60.1
pkgrel=1
pkgdesc="Authentication, registration, account management and 3rd party account authentication"
arch=(any)
url="https://github.com/pennersr/django-allauth"
license=(MIT)
depends=(
  python
  python-asgiref  # implicitly provided via python-django
  python-cryptography  # implicitly provided via python-requests-oauthlib -> python-oauthlib
  python-django
  python-openid
  python-requests
  python-requests-oauthlib
  python-pyjwt
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pillow
  python-pytest
  python-pytest-django
  python-qrcode
  python-saml
)
optdepends=(
  'python-qrcode: for MFA support'
  'python-saml: for SAML support'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('c5244a8e2f0cf5e7055d1be21357fc7309cca5593b12c7ad501e7f63e2cbe511cde7288458afa3d6b4390eb91036a5715c4108e78a7867fb14d01fe3e9d521d0')
b2sums=('fcdedbcf05c0c8446e324f70d85180b900b39c16655865bb10e561cae873d6920d8d45bcee476a425354d8ea32b354beabefc7c02ddc945cd29491c65d24de31')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  python manage.py test allauth
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
