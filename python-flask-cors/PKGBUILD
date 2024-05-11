# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-flask-cors
pkgver=4.0.0
pkgrel=2

pkgdesc='A Flask extension adding a decorator for CORS support'
url='https://pypi.org/project/Flask-Cors'
arch=('any')
license=('MIT')

depends=('python' 'python-flask' 'python-werkzeug')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("git+https://github.com/corydolphin/flask-cors.git#tag=$pkgver")

sha256sums=('a852ef4d8c1183fb6972b689b260ca01d397a60784e6a086d1079eb051379aad')

build() {
	cd flask-cors
	python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
	cd flask-cors
	# Upstream uses nosetests, which appears to test all Pyton files,
	# while unittest discovers test*.py only by default.
	python -m unittest discover -p '*test*.py'
}

package() {
	cd flask-cors
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
