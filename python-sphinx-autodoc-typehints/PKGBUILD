# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-autodoc-typehints
_pyname=${pkgname/python-/}
_commit=d2955c6c1750cdee28b05a2bfe35a5c5c0f8a043
pkgver=1.25.3
pkgrel=1
pkgdesc='Type hints support for the Sphinx autodoc extension'
url='https://github.com/tox-dev/sphinx-autodoc-typehints'
arch=('any')
license=('MIT')
depends=('python' 'python-sphinx')
makedepends=(
  'git'
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
)
checkdepends=(
  'python-nptyping'
  'python-pytest'
  'python-sphobjinv'
  'python-typing_extensions'
)
optdepends=('python-nptyping: for numpydoc support')
source=("git+$url.git#commit=${_commit}")
sha512sums=('SKIP')

build() {
  cd "${_pyname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pyname}"
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd "${_pyname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
