# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python-frozendict
pkgver=2.3.8
pkgrel=1
epoch=1
pkgdesc='An immutable dictionary'
url='https://pypi.python.org/pypi/frozendict/'
arch=('any')
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.org/packages/source/f/frozendict/frozendict-$pkgver.tar.gz")
sha512sums=('e0607e695bd7b70b32bdd939b394e6efad604948d1c0b14d3d5ae074c3d9e7a602f32c71c2ce66fb27a99bdd7fb3bf14998df9bea8a42ee7c11192cfe81380f3')
b2sums=('7b23b8663c04a9a5a6ef5586be5930e4daad99fa203805d4a5099c56d5eff3268f03b20113ec7a4585cfa8a5bee618253888d7e2f6e41baa0f3a1063b7ba5c2c')

build() {
	cd frozendict-$pkgver
	python setup.py py build
}

check(){
	cd frozendict-$pkgver
	PYTHONPATH="$PWD/build/lib" pytest
}

package() {
	cd frozendict-$pkgver
	python setup.py py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=PKGBUILD :
