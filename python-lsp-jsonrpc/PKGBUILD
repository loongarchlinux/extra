# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Platon Pronko <platon7pronko@gmail.com>

pkgname=python-lsp-jsonrpc
pkgver=1.1.2
pkgrel=2
pkgdesc="Fork of the python-jsonrpc-server project, maintained by the Spyder IDE team and the community"
arch=("any")
url="https://github.com/python-lsp/python-lsp-jsonrpc"
license=(MIT)
depends=(python-ujson)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
source=($pkgname-$pkgver.targz::https://github.com/python-lsp/python-lsp-jsonrpc/archive/v${pkgver}.tar.gz)
sha256sums=('68c19efd2968210903e3164e6940cfc08772b287e387046a6531bef23bf14a8e')

build() {
  cd python-lsp-jsonrpc-${pkgver}
  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python -m build --wheel --no-isolation
}

package() {
  cd python-lsp-jsonrpc-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
