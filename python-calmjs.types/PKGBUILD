# Maintainer: David Runge <dvzrv@archlinux.org>

_name=calmjs.types
pkgname=python-calmjs.types
pkgver=1.0.1
pkgrel=7
pkgdesc="Base types for calmjs framework"
arch=(any)
url="https://github.com/calmjs/calmjs.types"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('a2445cd6b5b55405058d1e90d1b7353c30135deb5656a1325f84590adc7567ac9d71b96365ac3fa5f8c33e571992508a9664d340c01da85e03bef4b6a8b67485')
b2sums=('1b9d7a6ccbef33f756d70d0ea77813172a647e94f7df57b4d9a422a6fac6811d2b477e9682a359b814f6cf57db72f81d12bd6cada6b1cb76d1472b42774bb768')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
