# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pwndbg
pkgver=2024.02.14
pkgrel=3
pkgdesc='Makes debugging with GDB suck less'
url='https://github.com/pwndbg/pwndbg'
arch=('any')
license=('MIT')
depends=(
  debuginfod
  gdb
  python
  python-capstone
  python-psutil
  python-pt
  python-ptrace
  python-pwntools
  python-pycparser
  python-pyelftools
  python-pygments
  python-requests
  python-setuptools
  python-tabulate
  python-typing_extensions
  python-unicorn
  which
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
optdepends=(
  'checksec: checksec command support'
  'ropper: ropper command support'
  'ropgadget: ropgadget command support'
  'radare2: radare2 command support'
  'rizin: rizin command support'
)
source=(https://github.com/pwndbg/pwndbg/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('3d55e762cecd2b42b9debb36f3ee0a8983be744192d4c1a0424517b0fd8ae8fb329197228a88ddd726e640f1bcd0e0bcdc7e95a64e041630e20cfcbf6acff1aa')
b2sums=('75524fb9f701769f2a117b4aa1158f648cd854fd38475c20bee4b7ae27ae8f331c40367738a467dd5c7f8994ac80efd3290a64e59ffb9e5a240546be8fb1c6e8')

prepare() {
  cd ${pkgname}-${pkgver}
  rm -rf caps profiling
}

build() {
  cd ${pkgname}-${pkgver}
  python -m compileall *.py
  python -O -m compileall *.py
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -d "${pkgdir}/usr/share/pwndbg"
  cp -r *.py __pycache__ "${pkgdir}/usr/share/pwndbg"
  touch "${pkgdir}/usr/share/pwndbg/.skip-venv"

  install -Dm 644 README.md FEATURES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
