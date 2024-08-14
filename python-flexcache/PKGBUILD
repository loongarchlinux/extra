# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=python-flexcache
_name=${pkgname#python-}
pkgver=0.3
pkgrel=2
pkgdesc="A robust and extensible package to cache on disk the result of expensive calculations."
arch=(any)
url="https://github.com/hgrecco/flexcache"
license=(BSD-3-Clause)
depends=(
  python
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mpl
  python-pytest-subtests
)
source=("git+$url.git#tag=$pkgver")
b2sums=('6222032a1e1b2b42b46a7b734d7720d2d80b701f75d0e6e496a44c7f72dcf268e7eef7458df46fdd2f7f7d3b236bd486b057fd8950fd6b08e4f197a6067921c6')

prepare() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"
  pytest
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
