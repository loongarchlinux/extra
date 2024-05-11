# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-allauth
pkgname=python-django-allauth
pkgver=0.62.1
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
sha512sums=('b9723a67babb070a159bf9ff5fef91ba91ab970ea6ca0b1e5f2a4cf75ba57460d7d7d3d376cae4e521c9980013a034aba8f745aa2a1cec7603a236712ef3dff8')
b2sums=('1818279892c1e220f9039248ba70e6d312f950bcae8689fd2418ae0d5e3e98e110b0bdf7e0f868c47277f6b6ac5d6e41bb95d5f5baf82d72656f1b4769cc44f0')

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
