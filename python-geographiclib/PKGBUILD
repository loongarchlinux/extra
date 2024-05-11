# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-geographiclib
_name="${pkgname#python-}-python"
pkgver=2.0
pkgrel=4
pkgdesc="Python implementation of the geodesic routines in GeographicLib"
arch=(any)
url="https://github.com/geographiclib/geographiclib-python"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('6e9e43eb8c42f051b7f36996bf62d533b3d636fec2f9e9403a8b31d61432bf1f053918e6dd31b8760d2067d24fb2688400800abf91770ca38469dd93b42f838f')
b2sums=('496e35dfe8f00b3b8ea278cf28640e3a075db118b248d40a5b02727a3c52dd620465d321bd479925eb990b2ff5a77f99cfaecc332f978b7bb240802f18e886f6')

prepare() {
  cd $_name-$pkgver
  # some people have bizarre ideas about how to do Python packaging...
  sed "s/@Python_VERSION_NUMBER@/3/; s/@PROJECT_VERSION@/$pkgver/; s/@PROJECT_FULLVERSION@/$pkgver/" setup.py.in > setup.py
  sed "s/@PROJECT_VERSION_MAJOR@/2/; s/@PROJECT_VERSION_MINOR@/0/; s/@PROJECT_VERSION_PATCH@/$pkgver/; s/@PROJECT_VERSION@/$pkgver/; s/@PROJECT_FULLVERSION@/$pkgver/; s/@RELEASE_DATE@/2022-04-23/" "${pkgname#python-}/__init__.py.in" > "${pkgname#python-}/__init__.py"
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
