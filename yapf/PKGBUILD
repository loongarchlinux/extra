# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=yapf
pkgver=0.40.2
pkgrel=2
pkgdesc="Python style guide checker"
arch=('any')
url="https://github.com/google/yapf"
license=('Apache')
depends=('python' 'python-importlib-metadata' 'python-platformdirs')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose')
source=("https://github.com/google/yapf/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-tomllib.patch::https://github.com/google/yapf/pull/1152.patch)
sha512sums=('be71b622efde162d64e5143c2a27de254a3791c229046309a083fa0df00afb4170cf0427c4402d3c621ca2120210ba15aa6d124ef7b8790c4b72705f5c5342e3'
            '4cf96842f113b58ed3263573865bc1c00fd48c7db0a346de1a20d51114a839138c0f3cdd03ce0c9227026c3d3887f7eef53d3632aad0afe85d52d189c7757ff2')

prepare() {
  cd yapf-$pkgver
  patch -p1 -i ../$pkgname-tomllib.patch
}

build() {
  cd yapf-$pkgver
  python -m build -nw
}

check() {
  cd yapf-$pkgver
  PYTHONPATH="$PWD/third_party" nosetests3
}

package() {
  cd yapf-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
}
