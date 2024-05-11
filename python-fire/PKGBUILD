# Maintainer: David Runge <dvzrv@archlinux.org>

_name=fire
pkgname=python-fire
pkgver=0.6.0
pkgrel=2
pkgdesc="A library for automatically generating command line interfaces"
arch=(any)
url="https://github.com/google/python-fire"
license=(Apache-2.0)
depends=(
  python
  python-six
  python-termcolor
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-levenshtein
  python-pytest
)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-0.5.0-mock.patch
)
sha256sums=('54ec5b996ecdd3c0309c800324a0703d6da512241bc73b553db959d98de0aa66'
            'c6522652e657dc86a2764c2857e61ebf0b7c4f6ef55b2baf887210163613ac6b')
b2sums=('5eb8a7ec2e0f93bec50f0b6a03edfe9ec6040ca2f3a85a77875df752457281c7614874254db935dcd94c229af3fd6722088c43dae7664e99c3f09047f9d4453f'
        '880b49315c13c5954cab9f65b6a78eecc8894022002104db8da77b659c95555bfefae1a92b67b8be3610d55ff1615d4cf60fe4c10818eaef6340f1b8e80ad872')

prepare() {
  # remove use of python-mock as upstream will take forever to do that: https://github.com/google/python-fire/issues/469
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.5.0-mock.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  # remove test files: https://github.com/google/python-fire/issues/422
  rm -frv "$pkgdir/$_site_packages/$_name/"{testutils,*_test}.py
}
