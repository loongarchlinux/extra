# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=humanize
pkgname=python-$_pkgname
pkgver=4.9.0
pkgrel=2
pkgdesc='Common humanization utilities for Python'
arch=(any)
url="https://github.com/$pkgname/$_pkgname"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-hatch-vcs
             python-hatchling)
checkdepends=(python-freezegun
              python-pytest)
_archive="$_pkgname-$pkgver"
source=("https://pypi.python.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('582a265c931c683a7e9b8ed9559089dea7edcf6cc95be39a3cbc2c5d5ac2bcfa')

prepare() {
	cd "$_archive"
	sed -i -e "/^__version__/s/=.*/= '$pkgver'/" src/humanize/__init__.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/src"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENCE
}
