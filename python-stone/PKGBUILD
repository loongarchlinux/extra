# Maintainer:

pkgname=python-stone
_name=${pkgname#python-}
pkgver=3.3.6
pkgrel=1
pkgdesc='The Official API Spec Language for Dropbox API V2'
arch=(any)
url='https://github.com/dropbox/stone'
license=(MIT)
depends=(python python-ply python-six)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-coverage
  python-pytest
)
source=(git+$url#tag=v$pkgver)
sha256sums=('943231843fa7dd6b28beb3a831e1341fc03830b7e28ccefd97f6cb24df0ab045')

prepare() {
  sed -e '/pytest-runner/d' -i $_name/setup.py # Remove pytest-runner from setup_requires
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  pytest -vv
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
