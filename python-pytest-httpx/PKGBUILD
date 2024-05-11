# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-httpx
pkgver=0.30.0
pkgrel=1
pkgdesc='Send responses to httpx'
arch=('any')
license=('MIT')
url='https://colin-b.github.io/pytest_httpx'
depends=('python-httpx' 'python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest-asyncio')
source=("https://github.com/Colin-b/pytest_httpx/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e3c20993921a5ae23a6dabcb68e495477fad32fdf69ce8a03b3a7fb5ab9732b364b5293c91fa7bb0eab7e57fe681a7ef118e8df1cdfc15ff012a6f5496207ec7')

build() {
  cd pytest_httpx-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # Hack entry points by installing it

  cd pytest_httpx-$pkgver
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest_httpx-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
