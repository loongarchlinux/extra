# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-parse
pkgver=1.20.2
pkgrel=1

pkgdesc='Parse strings using a specification based on the Python format() syntax.'
url='https://pypi.python.org/pypi/parse'
arch=('any')
license=('BSD')

depends=('python')
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/r1chardj0n3s/parse/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('3bfd59c6a3c45fe1a8730ad11374724906b66614d35fd261b8d4c36c266da6a0')

prepare() {
  cd parse-$pkgver
  # Drop pytest configuration file so we don't need to add pytest-coverage to checkdepends
  rm .pytest.ini
}

build() {
  cd "$srcdir"/parse-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/parse-$pkgver
  PYTHONPATH=build/lib pytest
}


package() {
  cd "$srcdir"/parse-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
