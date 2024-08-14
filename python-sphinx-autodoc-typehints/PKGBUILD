# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-sphinx-autodoc-typehints
_pyname=${pkgname/python-/}
pkgver=2.2.3
pkgrel=1
pkgdesc='Type hints support for the Sphinx autodoc extension'
arch=(any)
url=https://github.com/tox-dev/sphinx-autodoc-typehints
license=(MIT)
depends=(
  python
  python-sphinx
)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
checkdepends=(
  python-nptyping
  python-pytest
  python-sphobjinv
  python-typing_extensions
)
optdepends=('python-nptyping: for numpydoc support')
source=("git+$url.git#tag=$pkgver")
b2sums=('2658e6b9352d06584ce3e0f33c0a7ac737aab305158dca2f726c41154050fbfd2257ba965c2b6fd5336c48c00c25e06bf82ebb3dd3197584bd6db2a600d114d7')

build() {
  cd "$_pyname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pyname"
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd "$_pyname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${_pyname//-/_}-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
