# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=jrnl
pkgver=4.1
pkgrel=2
pkgdesc="Collect your thoughts and notes without leaving the command line"
arch=('any')
url="https://jrnl.sh/"
license=('GPL3')
depends=('python-colorama' 'python-cryptography' 'python-keyring' 'python-parsedatetime'
         'python-dateutil' 'python-pyxdg' 'python-rich' 'python-ruamel-yaml' 'python-tzlocal')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest7' 'python-pytest-bdd' 'python-pytest-xdist' 'python-toml')
source=("https://github.com/jrnl-org/jrnl/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "pytest-bdd-compat.patch")
sha512sums=('c5e17b8dd863cdf251f5622099e07645d65ecb27a4b765df6b6c6f89a482e73b800e4906f14ffffc9567b3f9620f87f98fcc0b5ae355a22368f90a3279718252'
            '8f7022d8ea813ae1dac6b4965b0dcf2ccc72451f2b62fab46c5ad4c9611711c66d0ddfd7554ac0d3a5870c60631dd094e59f5ec8c764c067b6cbe9722b2f44de')

prepare() {
  cd jrnl-$pkgver
  patch -Np1 -i ${srcdir}/pytest-bdd-compat.patch
}

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
