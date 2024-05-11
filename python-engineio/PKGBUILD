# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-engineio
pkgver=4.9.0
pkgrel=1
pkgdesc='Python implementation of the Engine.IO realtime server'
url='https://github.com/miguelgrinberg/python-engineio'
arch=('any')
license=('MIT')
depends=('python' 'python-websocket-client' 'python-websockets' 'python-requests')
optdepends=('python-eventlet: eventlet driver'
            'python-aiohttp: aiohttp driver'
            'python-tornado: tornado driver'
            'python-gevent: gevent driver'
            'python-gevent-websocket: gevent driver')
makedepends=('python-setuptools' 'python-sphinx' 'python-six' 'python-eventlet' 'python-aiohttp' 'python-tornado'
             'python-urllib3' 'python-gevent' 'python-gevent-websocket'
             'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
options=('!makeflags')
source=(https://github.com/miguelgrinberg/python-engineio/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('24838cb71ca3beda6a28deaa37208fae0e673bb0a00696594aa638af95e49af479b0088809f093ace9b2a8f5f7a4dcc95bbd2aa5c97938137b6e594ac1a7950d')
b2sums=('e14bb11f5762c42a77d782b0e1ce20c30f0f5599ba0c4577699d53f085464ce588660805d1b8c18a147b3bf01a2e255980f21e36003127e17351c28bd42f433e')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
  PYTHONPATH="$PWD/src" make -C docs man text SPHINXBUILD=sphinx-build
}

check() {
  cd ${pkgname}-${pkgver}
  PYTHONPATH=build/lib pytest -v
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/python-engineio.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
