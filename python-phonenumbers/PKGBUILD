# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-phonenumbers
pkgver=8.13.36
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-protobuf')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#tag=v$pkgver")
sha512sums=('81a76b86856cbf9072f2c198b9b218aa8e923b4f5257d39cf77dda66ff3be89a71919add5c9e8ac3ac361c27dcd5d0c7ee4d3c511fc24b9d7d85c2117bc9c6ec')

build() {
  cd python-phonenumbers/python
  python -m build --wheel --no-isolation
}

check() {
  cd python-phonenumbers/python
  python -m unittest -v
}

package() {
  cd python-phonenumbers/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
