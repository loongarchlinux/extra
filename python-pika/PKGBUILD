# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-pika
pkgver=1.3.2
pkgrel=2
pkgdesc="Pure Python RabbitMQ/AMQP 0-9-1 client library"
arch=(any)
url="https://github.com/pika/pika/"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
# checkdepends=('python-tornado' 'python-twisted' 'python-gevent')
optdepends=('python-tornado: use with Tornado I/O loop'
            'python-twisted: use with Twisted I/O loop'
            'python-gevent: use with Gevent I/O loop')
source=("git+https://github.com/pika/pika.git#tag=${pkgver}")
sha256sums=('86c8ced6356aaba2eddbdd05dd2af4b67443395c9a678fff0afa82c1159f7f38')

build() {
  cd pika
  python -m build --wheel --no-isolation
}

check() {
  cd pika
  # Requires rabbitq node
}

package() {
  cd pika
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
