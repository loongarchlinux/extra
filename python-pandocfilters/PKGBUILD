# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: <gmail.com: Jesse Jaara>
# Contributor: Gabriel Laskar <gabriel@lse.epita.fr>

pkgname=python-pandocfilters
_pkgname="${pkgname#python-}"
pkgver=1.5.1
pkgrel=2
pkgdesc='A python module for writing pandoc filters'
arch=(any)
url='https://github.com/jgm/pandocfilters'
license=(BSD)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('002b4a555ee4ebc03f8b66307e287fa492e4a77b4ea14d3f934328297bb4939e')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir/" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
