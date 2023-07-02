# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=jrnl
pkgver=4.0.1
pkgrel=1
pkgdesc="Collect your thoughts and notes without leaving the command line"
arch=('any')
url="https://jrnl.sh/"
license=('GPL3')
depends=('python-ansiwrap' 'python-colorama' 'python-cryptography' 'python-keyring'
         'python-parsedatetime' 'python-dateutil' 'python-pyxdg' 'python-rich' 'python-ruamel-yaml'
         'python-tzlocal')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-pytest-bdd' 'python-pytest-xdist' 'python-toml')
source=("https://github.com/jrnl-org/jrnl/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b116b380e32654b33a2c5d211096df675476f25c788a7943cc0e580cda0dae5f9a9123a17f1c06a20e35360bd737a83f1e998469ee002824dbec112ebaed2f57')

build() {
  cd jrnl-$pkgver
  python -m build -nw
}

check() {
  cd jrnl-$pkgver
  python -m pytest
}

package() {
  cd jrnl-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
