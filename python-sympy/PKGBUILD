# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: Peter Garceau <RockyChimp@gmail.com>

pkgname=python-sympy
pkgver=1.13.1
pkgrel=1
arch=('any')
pkgdesc='Symbolic manipulation package (Computer Algebra System), written in pure Python'
url='https://sympy.org/en/index.html'
license=('BSD')
depends=('python-mpmath')
optdepends=('ipython: user friendly interface for isympy'
            'python-symengine: optimized backend, set USE_SYMENGINE=1 to use')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
checkdepends=('python-hypothesis'
              'python-pytest')
source=(git+https://github.com/sympy/sympy#tag=sympy-$pkgver)
sha512sums=('0b34083447bffa9349e59310dc4807646c501e7f44c5fe2b80731e57b68e1ceaa87defa7316429847a462210382629eab491cd6ed3eed2a1f6b55e2cc1cdfab1')

build() {
  cd sympy
  python -m build --wheel --no-isolation
}

check() {
  cd sympy
  bin/test -v
}

package() {
  cd sympy

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
