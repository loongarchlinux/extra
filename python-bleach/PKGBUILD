# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-bleach
pkgver=6.1.0
pkgrel=2

pkgdesc="An easy whitelist-based HTML-sanitizing tool"
url="https://pypi.org/project/bleach/"
arch=('any')
license=('Apache')
depends=('python-packaging'
         'python-six'
         'python-webencodings')
makedepends=('python'
             'python-setuptools')
checkdepends=('python-pytest')
optdepends=('python-tinycss2: for CSS sanitisation')

source=(https://pypi.org/packages/source/b/bleach/bleach-$pkgver.tar.gz)

sha256sums=('0a31f1837963c41d46bbf1331b8778e1308ea0791db03cc4e7357b97cf42a8fe')

prepare() {
	cd "$srcdir"/bleach-$pkgver
}

build() {
	cd "$srcdir"/bleach-$pkgver
	python setup.py build
}

# Upstream broke the test suite.
check() {
	cd "$srcdir"/bleach-$pkgver
	python -m pytest
}

package() {
	cd "$srcdir"/bleach-$pkgver
	python setup.py install --skip-build --optimize=1 --root="$pkgdir"
}
