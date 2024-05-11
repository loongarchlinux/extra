# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pprofile
_name="${pkgname#python-}"
pkgver=2.1.0
pkgrel=4
pkgdesc="Line-granularity, thread-aware deterministic and statistic pure-python profiler"
arch=(any)
url="https://github.com/vpelletier/pprofile"
license=(GPL-2.0-or-later)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  $pkgname-2.1.0-versioneer_python3.12.patch
)
sha512sums=('0c19b8b1f127b51c75c81382fb33f5f76092fafae4c2839fae2d43e5591c842b04a174112ba0c6df5a4428de240f61cd73d779b0e48ddda983ae22997091a71d'
            '8cfce1de563f058ac40f5e1e1031af4167993c3f0b9d1671c86b4c8a9f660c87e5931d8416ccc21a4c9aa9aaa15b27ac98327d2b82595914e1415e849c4bc508')
b2sums=('e14e4b6626d88185a3c0ff3b441d61e166a39a3f6e6df115e8228159058cedd7e5f4dd19775c20937e8831adc583d800545b55d9a72810b9421059937402aedd'
        'f33792864d2675950700b70f8d72e3043e9355bb4e8993c10ee6b9973589ba18fd999817fb54f09ee96ff07b7b8b00c4cd89eaaa75563621e8e0e2322bfef02b')

prepare() {
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-2.1.0-versioneer_python3.12.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
