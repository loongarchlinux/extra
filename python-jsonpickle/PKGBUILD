# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonpickle
pkgver=3.0.2
_commit=7ceb2e7b61a24cb6ec0fb48a34943e802de019f8
pkgrel=2
arch=('any')
pkgdesc="Python library for serializing any arbitrary object graph into JSON"
url="https://jsonpickle.github.io/"
license=('BSD-3-Clause')
depends=('python')
optdepends=("python-numpy: for serializing sklearn models, numpy arrays, and other numpy-based data"
            "python-gmpy2: for serializing ecdsa module's keys")
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-numpy' 'python-feedparser' 'python-simplejson' 'python-gmpy2'
              'python-pymongo' 'python-ujson' 'python-pandas' 'python-pytest')
source=("git+https://github.com/jsonpickle/jsonpickle.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd jsonpickle
  # do not run coverage in an integration test
  sed -i 's/--cov//' pytest.ini
}

build() {
  cd jsonpickle
  python -m build --wheel --no-isolation
}

check() {
  cd jsonpickle
  pytest
}

package() {
  cd jsonpickle
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
