# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-django-picklefield
pkgver=3.2.0
pkgrel=1
pkgdesc='A pickled object field for Django'
arch=(any)
url=https://github.com/gintas/django-picklefield
license=(MIT)
depends=(python-django)
makedepends=(
  git
  python-setuptools
)
_tag=d81b76896a305025824b7b5e80fee93746bcf570
source=(git+https://github.com/gintas/django-picklefield.git#tag=${_tag})
sha256sums=('e74c45b054c50ab2f8fb395723eb3788bf89810bb8e72ead5f2b346f2fb2dd5c')

pkgver() {
  cd django-picklefield

  git describe --tags | sed 's/^v//'
}

build() {
  cd django-picklefield

  python setup.py build
}

package() {
  cd django-picklefield

  python setup.py install --skip-build --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-django-picklefield/
}

# vim: ts=2 sw=2 et:
