# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=identify
pkgname=python-identify
pkgver=2.5.26
pkgrel=1
pkgdesc="File identification library for Python"
arch=(any)
url="https://github.com/pre-commit/identify"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-ukkonen
)
optdepends=(
  'python-editdistance-s: for returning license identifiers'
  'python-ukkonen: for returning license identifiers'
)
source=($_name-$pkgver.tar.gz::https://github.com/pre-commit/$_name/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('4c17c7f40b14fd45649e0a6b6885e2d96a1ce3cf91fbc1092fdb9b92d7bf2ac35b0c04a24bb3e77f3188a3c8d00f57dbe19ca660e1e08b60cdb60385f340c4bd')
b2sums=('383c6467436107cf98a667f1db3ab63f42aadff8f51d2f6bedf715dd45590eeb5fe7b3d6572b7704a7ae613d079a22a2d84c86581b7a63b7578807e06034aa70')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
