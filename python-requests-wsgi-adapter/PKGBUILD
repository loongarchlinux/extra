# Maintainer: David Runge <dvzrv@archlinux.org>

# NOTE: upstream is abandonware
pkgname=python-requests-wsgi-adapter
_name="${pkgname#python-}"
pkgver=0.4.1
# pin commit that likely reflects 0.4.1: https://github.com/seanbrant/requests-wsgi-adapter/issues/20
_commit=5b771effb5414096089375a3a36a3e7af1522ae0
pkgrel=3
pkgdesc="WSGI Transport Adapter for Requests"
arch=(any)
url="https://github.com/seanbrant/requests-wsgi-adapter"
license=(BSD-3-Clause)
depends=(python-requests)
makedepends=(git python-build python-installer python-setuptools python-wheel)
source=(
  git+$url.git#commit=$_commit
)
sha256sums=('84b67939701a2b2887c6c8db9eba0a91fe6d1348a19021331064d9c4d97c90d0')
b2sums=('898884b77a7a3bcc84d17a5161ab9b3476729ede4a8082a2babfd19e47a5c18cde2d3cbcdfc5af6960ba2890ff0d1ba02946fab811c50f89abca2d60e3104357')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  python -m unittest discover -v
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
