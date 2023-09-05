# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-readme-renderer
pkgver=41.0
pkgrel=1
pkgdesc="Safely render long_description/README files in Warehouse"
url="https://github.com/pypa/readme_renderer"
license=('Apache')
arch=('any')
depends=('python-bleach' 'python-docutils' 'python-pygments')
optdepends=('python-cmarkgfm: for Markdown support')
makedepends=('python-cmarkgfm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-runner')
source=(https://github.com/pypa/readme_renderer/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('ea12974e412c5e6b4c55086c41c6ceae8ea388a9e2e67d10c016c6c843521cacc694b0066f9269bb96c0a7213171d7cea33c04282d730f9cc8aa3b5b78cb72c7')

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
