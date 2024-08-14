# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python-pyopenssl
pkgver=24.1.0
pkgrel=1
pkgdesc='Python wrapper around the OpenSSL library'
arch=('any')
url='https://pyopenssl.org/'
license=('Apache-2.0')
depends=('python' 'python-cryptography')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-pretend' 'python-pytest-rerunfailures')
source=("$pkgname::git+https://github.com/pyca/pyopenssl#tag=$pkgver")
sha512sums=('d414fbe11a0a55f789708b38af7539cf82b6a9fddd90f72971b86592ec2ad597dfcea0dfd90b7b0ce3120d14f6a3ae1eb73cb2de3af06b6d8a3ffa9d811a6c85')
b2sums=('cc7b4ab0db657980f15a16d068a48f763e384c42fcdd31d94255cb759b89717e26355ab9841fe70b90a5d91b03c56f278477744e739a9f59414044ac680ee7f7')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD"/build/lib pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim: ts=2 sw=2 et:
