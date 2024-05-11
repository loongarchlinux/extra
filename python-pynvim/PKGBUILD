# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=python-pynvim
pkgver=0.5.0
pkgrel=3
pkgdesc='Python client for Neovim'
url='https://github.com/neovim/pynvim'
arch=('any')
license=('Apache')
depends=('python' 'python-msgpack' 'python-greenlet')
provides=('python-neovim')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
replaces=('python-neovim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neovim/pynvim/archive/${pkgver}.tar.gz")
sha256sums=('448414e8d005b6d99868c8badeec7a20b10a7a37fb6b85fb12846b80c044c279')

prepare() {
  sed -i "s/msgpack-python/msgpack/g" pynvim-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/pynvim-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/pynvim-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set sw=2 sts=2 et:
