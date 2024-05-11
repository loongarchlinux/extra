# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-readme-renderer
pkgver=43.0
pkgrel=2
pkgdesc="Safely render long_description/README files in Warehouse"
url="https://github.com/pypa/readme_renderer"
license=('Apache')
arch=('any')
depends=('python-docutils' 'python-pygments' 'python-nh3')
optdepends=('python-cmarkgfm: for Markdown support')
makedepends=('python-cmarkgfm' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=(https://github.com/pypa/readme_renderer/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('1b701728afeb14dee36a32c00117796a84c3026dcc09a65f7674ab5cd5e20c33b0485e96429ee41f5864f31c009907d23870b8e40531f4008bbcb021c9eb2ba6')

build() {
  cd readme_renderer-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd readme_renderer-$pkgver
  pytest -v
}

package() {
  cd readme_renderer-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
