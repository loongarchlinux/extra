# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-engineio
pkgver=4.8.0
pkgrel=2
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
sha512sums=('351d982bf729a9747215d5845d9b547ecc5dd031cb3c32cd98d75b42374455e625ba0a8f7edf0db63354f7d905eedeb749145a851f8744571f0f2ab9d1142b47')
b2sums=('508c7303ee1020db27f7d8a26148b1748b9685f1d8fadb6abbe110e9b4acb85d6510c6bbc074ae0582efeab7c5b8e294eeed7115d34784bddd55f0b4bd20318f')

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
