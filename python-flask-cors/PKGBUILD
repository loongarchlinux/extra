# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-flask-cors
pkgver=4.0.0
pkgrel=1

pkgdesc='A Flask extension adding a decorator for CORS support'
url='https://pypi.org/project/Flask-Cors'
arch=('any')
license=('MIT')

depends=('python' 'python-flask' 'python-werkzeug')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("https://pypi.org/packages/source/F/Flask-Cors/Flask-Cors-$pkgver.tar.gz")

sha256sums=('f268522fcb2f73e2ecdde1ef45e2fd5c71cc48fe03cffb4b441c6d1b40684eb0')

build() {
	cd Flask-Cors-$pkgver
	python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
	cd Flask-Cors-$pkgver
	# Upstream uses nosetests, which appears to test all Pyton files,
	# while unittest discovers test*.py only by default.
	python -m unittest discover -p '*test*.py'
}

package() {
	cd Flask-Cors-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
