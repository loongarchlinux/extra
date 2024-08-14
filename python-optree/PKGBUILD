# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=optree
pkgname=python-"${_name}"
pkgver=0.12.1
pkgrel=1
pkgdesc="Optimized PyTree Utilities"
arch=(any)
url="https://github.com/metaopt/optree"
license=(Apache-2.0)
depends=(python python-typing_extensions)
makedepends=(python-setuptools python-build python-installer python-wheel cmake gcc pybind11)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bc34be3d3898cdcf0b318230e6273586dec495b79dfa82f422efa21f2b3414e4554a481c7f0dd12fbf33bf46bc99a3ca19c73076f8247afefaece138b39126d5')
b2sums=('a8c02cec62b5d81ee28ca3d07dde648b637b339782c65a3387b23dbd9fc374a2f27dde8aafa1451c4b288a0d094c8e3b408d876a278ad8937955868078cf0e3e')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
