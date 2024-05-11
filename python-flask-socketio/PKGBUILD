# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-flask-socketio
_pkgname=Flask-SocketIO
pkgver=5.3.6
pkgrel=2
pkgdesc='Socket.IO integration for Flask applications'
url='https://flask-socketio.readthedocs.org/'
arch=('any')
license=('MIT')
depends=('python' 'python-flask' 'python-eventlet' 'python-socketio')
makedepends=('python-setuptools' 'python-sphinx' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-coverage' 'python-pytest' 'python-tox-current-env' 'flake8' 'python-redis')
options=('!makeflags')
source=(https://github.com/miguelgrinberg/Flask-SocketIO/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b568358f826d9235c51f8dfb8460d1f3941d6915a22425f49e4f8e5e98f121872f01992ba8619216a5c21c8b97c5dbffb8a0841306933e8402f7f59e465ab87b')
b2sums=('95b1eaa572dc7419d1d0d37e068467fc4b87e111e4dd55c9fe4ec86579d2bdf7f50635ffaa897db3dde6851d0018691c9940ff44183307172ed57730746234a5')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
  make -C docs man text SPHINXBUILD=sphinx-build
}

check() {
  cd ${_pkgname}-${pkgver}
  PYTHONPATH="build/lib" pytest test_socketio.py
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/text/index.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/flask-socketio.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
