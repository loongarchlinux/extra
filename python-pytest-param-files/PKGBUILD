# Maintainer: Caleb Maclennana <caleb@alerque.com>

BUILDENV+=(!check)

pkgname=python-pytest-param-files
_pyname=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc='Create pytest parametrize decorators from external files '
arch=(any)
url="https://github.com/chrisjsewell/$_pyname"
license=(MIT)
depends=(python
         python-pytest)
makedepends=(python-{build,installer,wheel}
             python-flit-core)
_archive="${_pyname//-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('ab02608d63f7baf14483682ee6213c9330401f2a14d7a63489b872f6830a9848')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
