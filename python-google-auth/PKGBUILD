# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-google-auth
pkgver=2.25.2
pkgrel=1
pkgdesc="Google Authentication Library"
url="https://github.com/GoogleCloudPlatform/google-auth-library-python"
license=('Apache')
arch=('any')
depends=('python-cachetools' 'python-pyasn1-modules' 'python-rsa' 'python-urllib3'
         'python-certifi')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-mock' 'python-requests' 'python-flask'
              'python-oauth2client' 'python-pytest-localserver' 'python-cryptography'
              'python-freezegun' 'python-responses' 'python-pyopenssl' 'python-pyu2f')
source=("https://github.com/GoogleCloudPlatform/google-auth-library-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('90e20fb2a27facbf8bbb3338a55463041edf9565a6d79d979260aa8277d627d11a67b4c41dabb3d91ad0354a1268ae7a80ef434b7a73aedba3fd0c2d2caf738e')

prepare() {
  cd google-auth-library-python-$pkgver
  sed -i 's/from requests.packages.urllib3.util.ssl_ import/from urllib3.util.ssl_ import/' google/auth/transport/requests.py
}

build() {
  cd google-auth-library-python-$pkgver
  python setup.py build
}

check() {
  cd google-auth-library-python-$pkgver
  python -m pytest tests
}

package() {
  cd google-auth-library-python-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
