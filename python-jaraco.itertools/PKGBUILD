# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jaraco.itertools
pkgname=python-jaraco.itertools
pkgver=6.4.1
pkgrel=2
pkgdesc="Itertools for Python"
arch=(any)
url="https://github.com/jaraco/jaraco.itertools"
license=(MIT)
depends=(
  python
  python-inflect
  python-more-itertools
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-enabler
)
conflicts=(python-jaraco)
replaces=(python-jaraco)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('314fce562ebb45ea4822a98bbd7b22e5feac7d5118dbc1a4f1eb2cd046bffa47')
b2sums=('f384e7bdbe6068ed85a19e12aeae2ac0ca4bea52a4c3f4840a7ce258440c0a73c0f9f6928be59a1db2f2bef887710a95c423cbf1854bd0e58f068bd4fd833d08')

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
}
