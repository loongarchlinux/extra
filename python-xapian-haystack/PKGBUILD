# Maintainer: David Runge <dvzrv@archlinux.org>

_name=xapian-haystack
_haystack_name=django-haystack
_django_haystack_pkgver=3.2.1
pkgname=python-xapian-haystack
pkgver=3.1.0
pkgrel=1
pkgdesc="Xapian backend for Django-Haystack"
arch=(any)
url="https://github.com/notanumber/xapian-haystack"
license=(GPL2)
depends=(
  python
  python-django
  python-django-haystack
  python-filelock
  python-xapian
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  https://files.pythonhosted.org/packages/source/${_haystack_name::1}/$_haystack_name/$_haystack_name-$_django_haystack_pkgver.tar.gz
)
sha512sums=('6ab09e683587699900c7cd00069e37f36bc62ea40bc92acb5b821f32e9d358068502fe690394c37090108e741a434d86ed4d84bc0dfe96e9456171443269c2d6'
            '60ce7297243ab5a43780b0aed6f25970ef0438aaadf8f7c92f89970e58c045d3f6ba7a5a635a275e21dc73b116fb33cad32a41991a677bd0a9c66aef4b7ff0c2')
b2sums=('008d1c98ab028f55e3edb863822c3a76df0fdb006a0d9739f1f6ed140945922dd19f605fc36b31c78806c31e2070da932bfc5dc420a0903cadbfc5c9f5232857'
        '6071ae9502a3bad885e95b79a1969b6ca6dd044a6d113726045d722168aa05d88b12047b0fbf7d7710936bd32158f2f9c27a6f29868e70e00f88ded1bc3b740a')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  # inserting xapian-haystack tests into django-haystack (because... pain)
  ln -sv "$PWD/build/lib/xapian_backend.py" ../$_haystack_name-$_django_haystack_pkgver/haystack/backends/
  cp -rv "$PWD/tests/"* ../$_haystack_name-$_django_haystack_pkgver/test_haystack/
  ln -svf "$PWD/tests/xapian_tests/__init__.py" ../$_haystack_name-$_django_haystack_pkgver/test_haystack/

  cd ../$_haystack_name-$_django_haystack_pkgver
  PYTHONPATH="$PWD:$PYTHONPATH" django-admin test test_haystack.xapian_tests --settings=test_haystack.xapian_settings
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
