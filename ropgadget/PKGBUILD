# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: s1gma <s1gma@mindslicer.com>

pkgname=ropgadget
_pkgname=ROPgadget
pkgver=7.4
pkgrel=2
pkgdesc='Search gadgets in binaries to facilitate ROP exploitation for several file formats and architectures'
url='http://www.shell-storm.org/project/ROPgadget'
arch=('any')
license=('BSD')
depends=('python' 'python-capstone')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=(https://github.com/JonathanSalwan/${_pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0906cf7e916967ac5f446778ddc4ffdca78b8cf23c584968c116fdd43bc8488624104fbb78380516a54356dc4c4d50c5d10cc462bdd507435d5f70f8b9d51fa7')
b2sums=('1c5dc52d377b4b580aa72351ce7863c9f819b39cbf0732b33eb8330d0229166250978fde123f8bf1e3a45d5fe791b17da1a93a49c8c45755d5dc1b7f8e05bf52')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed 's|python2|python|g' -i ropgadget/**/*.py ropgadget/*/*/*.py
}

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}
  ./ROPgadget.py --binary ./test-suite-binaries/elf-Linux-x86 --string "main"
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE_BSD.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
