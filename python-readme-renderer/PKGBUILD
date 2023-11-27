# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-readme-renderer
pkgver=42.0
pkgrel=1
pkgdesc="Safely render long_description/README files in Warehouse"
url="https://github.com/pypa/readme_renderer"
license=('Apache')
arch=('any')
depends=('python-docutils' 'python-pygments' 'python-nh3')
optdepends=('python-cmarkgfm: for Markdown support')
makedepends=('python-cmarkgfm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-runner')
source=(https://github.com/pypa/readme_renderer/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('8403aab68775ddf4d29f378418340f43097d36d39b52b622031d5f3f01d6bd8811edfe19e66f41f0d8a0082c7b4decc728e43b5f04e62e2adbe5912414eefabb')

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
