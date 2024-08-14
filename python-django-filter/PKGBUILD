# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-filter
pkgname=python-django-filter
pkgver=24.3
pkgrel=1
pkgdesc="A generic system for filtering Django QuerySets based on user selections"
arch=(any)
url="https://github.com/carltongibson/django-filter"
license=(BSD-3-Clause)
depends=(
  python
  python-django
)
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-wheel
)
checkdepends=(
  python-django-crispy-forms
  python-django-rest-framework
  python-pytest
)
optdepends=(
  'python-django-crispy-forms: for enhanced filter form presentation'
  'python-django-rest-framework: for filter integration using DRF'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('73455b44400a60e7c68655b4bf755afc66a4f8c28f1700dbd2970c7c36d5ed61d8b673d72c75219bec5414b850d7cb5ac0a55ee90291c4ac17a672a5202d2934')
b2sums=('e0403f597f2edb46efd800babedc227ce55b8e9084b7c1fabbd28d9fef85d43b3bc78c453f8c0edeaadfd74d4d3cfb9435378e7b1a2c1581acbed5593c235171')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python runtests.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,{CHANGES,README}.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
