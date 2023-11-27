# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-httpx
pkgver=0.27.0
pkgrel=1
pkgdesc='Send responses to httpx'
arch=('any')
license=('MIT')
url='https://colin-b.github.io/pytest_httpx'
depends=('python-httpx' 'python-pytest')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio')
source=("https://github.com/Colin-b/pytest_httpx/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5152a0632d6e5f09928e41339a29d2b7164c6969cfed0029ed1500d0352b7544590d79b7de864bd3ca97f35160b558328a721da54fb02ec1e0a99ecaf04c28ed')

build() {
  cd pytest_httpx-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest_httpx-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest_httpx-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
