# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Rich Li <rich at dranek com>
# Contributor: Thomas Haider <t.haider@deprecate.de>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir@eventualis.org>

_name=authentication-results-python
pkgname=python-authres
_commit=36222677b22795c82ba1ad602df8535abf99ca40 # No tags
pkgver=1.2.0
pkgrel=10
pkgdesc='Python Authentication-Results headers generation and parsing'
arch=('any')
url=https://launchpad.net/authentication-results-python
license=('Apachei-2.0')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+https://git.launchpad.net/$_name#commit=$_commit")
b2sums=('bd7a3469226ff406f6748b0d216646fd33e5ca78959d151d878bf2dde8a3737619260553c0eb7f507d39274a0c1d1efcf598a16f69715ac435b7e4d3fd1b2d1c')

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  python -m authres -v
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
