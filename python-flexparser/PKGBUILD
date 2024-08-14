# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=python-flexparser
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=2
pkgdesc="A parser by hgrecco"
arch=(any)
url=https://github.com/hgrecco/flexparser
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
sha256sums=('e3de6665dc91aba4d9657b86824f884a1069ae7e6c00796b2c8a6f09806b6029')

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
