# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cattrs
_pipname=${pkgname#python-}
pkgver=23.2.3
pkgrel=3
pkgdesc='Complex custom class converters for attrs'
arch=(any)
url='https://catt.rs'
# url='https://github.com/python-attrs/cattrs'
license=(MIT)
depends=(python
         python-attrs)
makedepends=(python-{build,installer,wheel}
             python-hatch-vcs
             python-hatchling)
# checkdepends=(python-hypothesis
#               python-pytest)
_archive="$_pipname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_archive.tar.gz")
# source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('a934090d95abaa9e911dac357e3a8699e0b4b14f8529bcc7d2b1ad9d51672b9f')

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
#         cd "$_archive"
#         export PYTHONPATH=src
#         pytest
# }

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
