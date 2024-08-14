# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-engineio
pkgver=4.9.1
pkgrel=1
pkgdesc='Python implementation of the Engine.IO realtime server'
url='https://github.com/miguelgrinberg/python-engineio'
arch=(any)
license=(MIT)
depends=(
  python
  python-requests
  python-websocket-client
  python-websockets
)
optdepends=(
  'python-eventlet: eventlet driver'
  'python-aiohttp: aiohttp driver'
  'python-tornado: tornado driver'
  'python-gevent: gevent driver'
  'python-gevent-websocket: gevent driver'
)
makedepends=(
  python-aiohttp
  python-build
  python-eventlet
  python-gevent
  python-gevent-websocket
  python-installer
  python-setuptools
  python-six
  python-sphinx
  python-tornado
  python-urllib3
  python-wheel
)
checkdepends=(
  python-pytest
)
options=('!makeflags')
source=(https://github.com/miguelgrinberg/python-engineio/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('1414d30fa3073124936909e1395e27579eea2b27862a9770b78c8d91b5568aff869e84f9477c7225cbe35462849445ce9ab17b8ca7b6e8aadeafcdebcb26df0b')
b2sums=('b776a56993f6dafe1778be93dbc507eb5ae96e44f0635b17fb3592fb9fca49c0a338393a128e05089a846b43f41328d788066f0b7a0edad78c88e3b14d6adec9')

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
