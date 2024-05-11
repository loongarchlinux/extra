# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python-frozendict
pkgver=2.4.0
pkgrel=2
epoch=1
pkgdesc='An immutable dictionary'
url='https://pypi.python.org/pypi/frozendict/'
arch=('any')
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://pypi.org/packages/source/f/frozendict/frozendict-$pkgver.tar.gz")
sha512sums=('56d190f3ae19e4d89c51c02fdc58bd29b61f73e7ecec97c6018117d966a40b84513a13e7d86c62c8a6c7fe8daed75b287881c315ef23120e17bfda21cfecc1f1')
b2sums=('595be3e7947d67ccc6952d91aee486849f653e041c41495dcc910f78cd4f043cf310fe2d3cc2e8d3dc0a3c354c9f137da96770ef18b64e65f0f72af2c54cbfcd')

build() {
	cd frozendict-$pkgver
	python -m build --wheel --no-isolation
}

check(){
	cd frozendict-$pkgver
	PYTHONPATH="$PWD/build/lib" pytest
}

package() {
	cd frozendict-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 tw=0 ft=PKGBUILD :
