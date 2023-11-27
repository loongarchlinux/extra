# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=humanize
pkgname=python-$_pkgname
pkgver=4.8.0
pkgrel=1
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
sha256sums=('9783373bf1eec713a770ecaa7c2d7a7902c98398009dfa3d8a2df91eec9311e8')

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
