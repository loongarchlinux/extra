# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-tiny-proxy
pkgver=0.2.1
pkgrel=3
pkgdesc='Simple proxy (SOCKS4(a), SOCKS5(h), HTTP tunnel) server built with anyio'
arch=('any')
url='https://github.com/romis2012/tiny-proxy'
license=('Apache')
depends=('python' 'python-anyio')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-trustme'
  'python-aiohttp'
  'python-httpx'
)
_commit='296712db1275ec1aa150298ca9a1e292ae0fe1e6'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

# Need more AUR dependencies
#check() {
#  cd $_pyname-$pkgver
#  python -m venv --system-site-packages test-env
#  test-env/bin/python -m installer dist/*.whl
#  test-env/bin/python -m pytest
#}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/tiny_proxy-$pkgver.dist-info/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
