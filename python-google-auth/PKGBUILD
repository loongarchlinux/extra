# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-google-auth
pkgver=2.21.0
pkgrel=1
pkgdesc="Google Authentication Library"
url="https://github.com/GoogleCloudPlatform/google-auth-library-python"
license=('Apache')
arch=('any')
depends=('python-cachetools' 'python-pyasn1-modules' 'python-rsa' 'python-six' 'python-urllib3'
         'python-certifi')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-mock' 'python-requests' 'python-flask'
              'python-oauth2client' 'python-pytest-localserver' 'python-cryptography'
              'python-freezegun' 'python-responses' 'python-pyopenssl' 'python-pyu2f')
source=("https://github.com/GoogleCloudPlatform/google-auth-library-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a615ff12a43f3efd602e86880f6419dffb46334299c4e9a7bfc76b63f29452b6fcd01cc400250e8296a241c2c85a25b453a0e6a871cfa7161d5431158dac5020')

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
