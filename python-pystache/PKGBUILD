# Maintainer:
# Contributor: Florian Klink <flokli at flokli dot de>

pkgname=python-pystache
_pkgname=pystache
pkgver=0.6.5
pkgrel=2
pkgdesc='The mustache template engine written in python'
arch=(any)
url='https://github.com/PennyDreadfulMTG/pystache'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("https://github.com/PennyDreadfulMTG/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('e3054e0bff5c3bc6679bf22555dd3cfb2f31b241484c7e6201d37b7767a22f2f842912e3f61d8e2e2858615a4f99ef4192d885b60f84dfeffa1408370ccfba75')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  # This package uses 2to3 to convert itself to Python 3 on the fly
  # So we need to jump through some hoops here
  test_dir="../test_dir"
  rm -rf "$test_dir"
  mkdir "$test_dir"
  python -m installer --destdir="$test_dir" dist/*.whl
  PYTHONPATH=$(readlink -e "$test_dir"/usr/lib/python*/site-packages/) \
  	"$test_dir"/usr/bin/pystache-test .
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
