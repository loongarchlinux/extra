# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-filter
pkgname=python-django-filter
pkgver=23.5
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
sha512sums=('5534a4e8538b4ed0b5dbc168a7ba4eb51b0431d22874d1d4613b421ec830f45caed8faa71ecb144ba26704ff842742e8517d1599277b84480c4bf4282c19308c')
b2sums=('8956441dc4425925ff8a121833fc59552709274a64d880aa5cadbae8063a67891969a712f79c9a5aa03fcd404ed288294e818e9f2e968c4d88761a847e35a3e9')

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
