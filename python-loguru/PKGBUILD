# Maintainer: David Runge <dvzrv@archlinux.org>

_name=loguru
pkgname=python-loguru
pkgver=0.7.2
pkgrel=2
pkgdesc="Python logging made (stupidly) simple"
arch=(any)
url="https://github.com/Delgan/loguru"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-colorama
  python-freezegun
  python-pytest
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('2b3517ef6941a3bb24ed108074194041b3de429d5d43fe9d51359f4abdd8bad5')
b2sums=('208c4ad989257e0e0d5cecf41c9722f398e5c73528f8a88c92e28490121723d5c19b4170ff246446e94237e8bb732f83e4b9fcc66c42aa7e3c1ba25aaa069e34')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_type_hinting.py  # we don't care about type hints
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
