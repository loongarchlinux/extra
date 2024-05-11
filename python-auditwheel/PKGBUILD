# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=auditwheel
pkgname=python-$_pkgname
pkgver=6.0.0
pkgrel=2
pkgdesc='Auditing and relabeling cross-distribution Linux wheels'
arch=('any')
url='https://github.com/pypa/auditwheel'
license=('MIT' 'BSD')
depends=('python' 'python-wheel' 'python-pyelftools' 'unzip' 'patchelf')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
#checkdepends=('python-pytest' 'python-jsonschema' 'python-pretend' 'python-docker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('900b0e5ea405a3cbd5bfa266dc97afc72cd77bf9539298dd5c33f078b7add3a302e6adeec29a16ced981b2e7749579725f40ac5d5f9574b0f15fed3c17d681ef')

prepare() {
  cd $_pkgname-$pkgver

  # replace the vendored wheel module with the one on the system
  find -type f -name '*.py' -exec \
      sed -i 's|\._vendor\.wheel|wheel|' '{}' \+

  # remove vendored wheel module
  rm -rf auditwheel/_vendor
}

build() {
  cd $_pkgname-$pkgver

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build -nw
}

#check() {
#  cd $_pkgname-$pkgver
#
#  python -m venv --system-site-packages test
#  test/bin/python -m installer dist/*.whl
#
#  PATH="test/bin:$PATH" python -m pytest
#}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl
  #install -Dm 644 auditwheel/policy/policy.json "$pkgdir"/usr/lib/python3.10/site-packages/auditwheel/policy/policy.json

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
