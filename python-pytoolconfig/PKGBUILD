# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: bonob <bonob at fastmail dot com>

pkgname=python-pytoolconfig
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=2
pkgdesc="Manage configuration for python tools, such as black and rope."
arch=('any')
url="https://github.com/bagel897/pytoolconfig"
license=('LGPL-3.0-or-later')
depends=('python' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
checkdepends=('python-docutils' 'python-pytest' 'python-sphinx' 'python-tabulate' 'python-platformdirs')
optdepends=(
	'python-platformdirs: for finding configuration dirs'
	'python-pydantic: for validation'
	'python-sphinx: for automatic documentation'
	'python-tabulate: for tables in documentation'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('07eaa7e66f25c9fda089c4f4ac306faea0794f65df9cabd9d4755a6b9e0ed8e3')

build() {
	cd "$_name-$pkgver"
	PDM_BUILD_SCM_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	cd "$_name-$pkgver"
	python -m installer --destdir=test_dir dist/*.whl
	export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
	pytest -vv tests
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
