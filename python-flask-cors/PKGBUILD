# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-flask-cors
pkgver=4.0.1
pkgrel=1

pkgdesc='A Flask extension adding a decorator for CORS support'
url='https://pypi.org/project/Flask-Cors'
arch=('any')
license=('MIT')

depends=('python' 'python-flask' 'python-werkzeug')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("git+https://github.com/corydolphin/flask-cors.git#tag=$pkgver")

sha256sums=('bfab47e211d1a0fb13c749b48a9275c4c758be7288707829f3ff317b96d2e2d0')

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
