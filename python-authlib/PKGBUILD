# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=authlib
pkgname=python-authlib
pkgver=1.2.1
pkgrel=1
pkgdesc="The ultimate Python library in building OAuth and OpenID Connect servers"
arch=('any')
url="https://github.com/lepture/authlib"
license=('BSD')
depends=('python-cryptography')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-asyncio' 'python-pytest-django' 'python-requests'
              'python-django' 'python-flask-sqlalchemy' 'python-httpx' 'python-starlette' 'python-cachelib')
source=("https://github.com/lepture/authlib/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8081a26b4e8ae30d6e24d9ada0eac0e615cc87292ec52f56013efee51d8c6b6f')
validpgpkeys=('72F8E895A70CEBDF4F2ADFE07E55E3E0118B2B4C') # Hsiaoming (UJET) <lepture@ujet.co>

prepare() {
  cd ${_pkgname}-$pkgver

  # no need to install an additional copy of the stdlib
  find tests -name \*.py -exec sed -i 's/^import mock$/from unittest import mock/' {} +
}

build() {
  cd ${_pkgname}-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-$pkgver

  export PYTHONPATH="$PWD"
  pytest tests/core -v
  pytest tests/flask -v
# https://github.com/lepture/authlib/issues/456
  pytest tests/jose -v -k 'not (test_dir_alg_xc20p or test_xc20p_content_encryption_decryption)'
  export DJANGO_SETTINGS_MODULE=tests.clients.test_django.settings
  pytest tests/clients -v
  export DJANGO_SETTINGS_MODULE=tests.django.settings
  pytest tests/django -v
}

package() {
  cd ${_pkgname}-$pkgver

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
