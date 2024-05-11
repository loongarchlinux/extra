# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vcrpy
_name="${pkgname#python-}"
pkgver=6.0.1
pkgrel=2
pkgdesc='Automatically mock your HTTP interactions to simplify and speed up testing'
arch=('any')
license=('MIT')
url='https://github.com/kevin1024/vcrpy'
depends=('python' 'python-pyyaml' 'python-wrapt' 'python-yarl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-aiohttp' 'python-boto3' 'python-httpx' 'python-pytest' 'python-pytest-aiohttp' 'python-pytest-asyncio' 'python-pytest-httpbin' 'python-requests' 'python-tornado')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('79ba9ea29db20ddc3db5676d7bdb05da17848eb126ed63d813a1d2b0de80573fff3afaec2ffe1af491a0310ce922c7545c4569035d0f5868f171db25965c217f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # we don't want to download the internet
    --ignore tests/integration
  )

  cd $_name-$pkgver
  PYTHONPATH=".:$PYTHONPATH" pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
