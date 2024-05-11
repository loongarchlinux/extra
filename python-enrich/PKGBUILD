# Maintainer: David Runge <dvzrv@archlinux.org>

_name=enrich
pkgname=python-enrich
pkgver=1.2.7
pkgrel=6
pkgdesc="Extends rich library functionality with a set of changes that were not accepted"
arch=(any)
url="https://github.com/pycontribs/enrich"
license=(MIT)
depends=(
  python
  python-rich
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-pytest-xdist
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  $pkgname-1.2.7-dependencies.patch
  $pkgname-1.2.7-remove_mock.patch
)
sha512sums=('f703303e51806386e7dc03e976a011096393b49550ceeb540a5156bbdee81d035ec06b7bce7ca022495711553f4d1060a37b94351937c0037498121a09b3774b'
            'a25a0d29dc89f52bc9af38bdcd488ea3cfc83377f39dacf4a6b3092ce5e3941ca6a3df1ecb50e257f1bc4a4011d33879bfe3989fd98ea495ae6008e3e70a51e1'
            'd81501e5e85a660cee24b595efc7d6422fa65cea9847213e9b88459687a39392481ad70b7d23390f25a3d4bd78519d0b31ad141db9dd4f6f0600be2bcff03948')
b2sums=('d3f1a624f96e44aeebc16c5de7e8c5e31976d91bff9a1ba951b4954c6d579fa5bdc982ecda6b4da3a2bd7591a4fd6d33b8223921ecc5a06eb1008a4ceb7882a0'
        'e4d986bc64975149e6d28786fe7b087494994ed4b3e4cee960ae75dcd8fb2f40523c7075bd02fef3981dfb29550d0645bc5fce1180eb4f58d80018c86bdec03e'
        'da111125ad961348865d1076305b5a9dea9affec4d52c9a6dca4839420f52f2b8ebc7f38b1d3f5e2d01da9c53937a0129793b06c1151d9b1628e366e0bdf24cd')

prepare() {
  # remove pip, wheel and setuptools-scm-git-archive from makedepends: https://github.com/pycontribs/enrich/pull/45
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-1.2.7-dependencies.patch
  # remove mock: https://github.com/pycontribs/enrich/pull/46
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-1.2.7-remove_mock.patch
}

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  # disable broken test: https://github.com/pycontribs/enrich/issues/40
  pytest -vv --deselect src/enrich/test/test_console.py::test_rich_console_ex
}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # remove tests: https://github.com/pycontribs/enrich/issues/47
  rm -frv "$pkgdir/$_site_packages/$_name/test/"
}
