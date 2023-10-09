# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg
pkgver=2023.07.17
pkgrel=1
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=('any')
license=('MIT')
depends=('gdb' 'python' 'python-capstone' 'python-unicorn' 'python-pycparser' 'python-psutil' 'python-tabulate'
         'python-pwntools' 'python-pyelftools' 'python-pygments' 'which')
optdepends=('checksec: checksec command support'
            'ropper: ropper command support'
            'ropgadget: ropgadget command support'
            'radare2: radare2 command support')
source=(https://github.com/pwndbg/pwndbg/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d261ed992327d62b0b3e7cc002d3185435748e27cc2ce0085d438848ef1bdb0b3921ae5c1ce19c25e49d52b10f8340eb67c4e05fc197d2adeb888b47e2c158ba')
b2sums=('e373a7408366090f58385dac8dfcdd13702c475117a35158a1a149d149c9a2cbf5f2702be33aeab537451cfd990b5253e9bc0283fa5ae197c9cceb680e65a724')

prepare() {
  cd ${pkgname}-${pkgver}
  sed '/0L/d' -i ida_script.py
}

build() {
  cd ${pkgname}-${pkgver}
  python -m compileall .
  python -O -m compileall .
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/usr/share/pwndbg"
  cp -r *.py pwndbg __pycache__ "${pkgdir}/usr/share/pwndbg"
  install -Dm 644 README.md FEATURES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
