# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-pt
_gitcommit=50227bda0b6332e94027f811a15879588de6d5cb
pkgver=r20240401.114.50227bd
pkgrel=1
pkgdesc='gdb script to examine the address space of a QEMU-based virtual machine'
url='https://github.com/martinradev/gdb-pt-dump'
arch=('any')
license=('MIT')
depends=(
  gdb
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
provides=(gdb-pt-dump)
source=(git+"${url}#commit=${_gitcommit}")
sha512sums=('fcdc19960513d573c468cdeedd9c6da090a9205083b2702bf20e8851127eb0687fe07ba605cd0dd6784ada1ae99071a3910a918ec87781dbfe5e4ca6b434afdc')
b2sums=('738400a7ef4f6fb7c37f70a7d6051ad80ee6130e4af7d03685a74eb5f2dcbab67b64f7fb5b354ad9b6175c864e468b96988099ecece9349bb23613092429584f')

pkgver() {
  cd gdb-pt-dump
  printf "r%s.%s.%s" "$(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd gdb-pt-dump
  python -m build --wheel --no-isolation
}

package() {
  cd gdb-pt-dump
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
