# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-mujson
_name="${pkgname#python-}"
pkgver=1.4
pkgrel=7
pkgdesc="Use the fastest JSON functions available at import time"
arch=(any)
url="https://github.com/mattgiles/mujson"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('ad648338ad08c17afe3d22a0b6937cf4ad5aabf5cbf8041f6147fef084f4c2f9c163932b942069593353bb245e118739205cb81c67708a398bc904cc176ea42d')
b2sums=('e534dc080d71c4b6a8bb6132de0863e5112e44bdc8e2200123260d7d257bf081d54882fd3e0591485379deab1bf36153beb6b4436363191acd50b619ff440f24')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
