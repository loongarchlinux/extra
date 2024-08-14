# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-authlib
pkgver=1.3.1
pkgrel=1
pkgdesc='The ultimate Python library in building OAuth and OpenID Connect servers & clients'
arch=('any')
url='https://github.com/lepture/authlib'
license=('BSD-3-Clause')
depends=('python' 'python-cryptography')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-django'
  'python-requests'
  'python-django'
  'python-flask-sqlalchemy'
  'python-httpx'
  'python-starlette'
  'python-cachelib'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('5dd333dc5452b9de54adb301f6d164f32a5931d67fed56911615688e897e3566c903016e60f191eca3c067c461aed4e351247b176d5d1c28e1823b7cc6cd0e04')
b2sums=('56bcadfe4f0094b34f5fb044e0cac64b606364dfa49d4951abeaaa8ce3a0e1fc1408f96adbedd034e26bd159ad8af891292548ffba1fd75c01e12b6a706f807e')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

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
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
