# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>  
# Contributor: Peter Garceau <RockyChimp@gmail.com>

pkgname=python-sympy
pkgver=1.12.1rc1
pkgrel=1
arch=('any')
pkgdesc='Symbolic manipulation package (Computer Algebra System), written in pure Python'
url='https://sympy.org/en/index.html'
license=('BSD')
depends=('python-mpmath')
optdepends=('ipython: user friendly interface for isympy'
            'python-symengine: optimized backend, set USE_SYMENGINE=1 to use')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("https://github.com/sympy/sympy/archive/sympy-$pkgver/sympy-$pkgver.tar.gz")
sha512sums=('38c4271c602bc8563a070d5f55122ace6baec5b72bc71a666c7a54cebcbc45833de0826f7d390fce84cba478c9ead12f2ee8040c19ca8d4f98d787f608aefdf0')

build() {
  cd sympy-sympy-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd sympy-sympy-$pkgver
  bin/test -v
}

package() {
  cd sympy-sympy-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
