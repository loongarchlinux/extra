# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cattrs
_pipname=${pkgname#python-}
pkgver=23.1.2
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=(any)
url="https://github.com/Tinche/$_pipname"
license=(MIT)
depends=(python
         python-exceptiongroup
         python-attrs)
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
# checkdepends=(python-pytest)
_archive="$_pipname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_archive.tar.gz")
# source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('db1c821b8c537382b2c7c66678c3790091ca0275ac486c76f3c8f3920e83c657')

prepare() {
    cd "$_archive"
    # Upstream test suite uses addopts to run benchmarks, drop them
    sed -i -e '/^addopts/d' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

# check() {
#     cd "$_archive"
#     pytest
# }

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
