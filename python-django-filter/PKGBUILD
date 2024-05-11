# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-filter
pkgname=python-django-filter
pkgver=24.2
pkgrel=3
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
sha512sums=('8a2f67ed497ab3866edd1fe12dc819ecaf5c1508eb44df164621c818c8e5a4ef9a5f4c584981170fd98d432b9231fb732826880ad37f63db65875195d1b4e103')
b2sums=('a45793644668525aee58eeea4d9e02c34d822234ef300853f393419ade54a00a3ff2b077db7d299a3b9165b5c689bb4d0e5f7f5417b33a73dc92202fafd9eeb3')

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
