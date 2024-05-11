# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-opt_einsum
_name="${pkgname#python-}"
pkgver=3.3.0
pkgrel=8
pkgdesc="Optimizing einsum functions in NumPy, Tensorflow, Dask, and more with contraction order optimization"
url="https://github.com/dgasmith/opt_einsum"
license=(MIT)
arch=(any)
depends=(
  python
  python-numpy
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  $pkgname-3.3.0-versioneer_configparser.patch::https://github.com/dgasmith/opt_einsum/commit/7c8f193f90b6771a6b3065bb5cf6ec2747af8209.patch
)
sha512sums=('3f1bebf25febc1e1a0aab6d87b56ac80642e7182604cca06dcffa8db02d84ad0eaa9b8d68093c7ef76a8a7eabe51798886f168ee32e9c59f12ff2de427b52baf'
            '9339a8e4701f2f4dc1ce06dcf61cc15bd96b4f115ca89a8e4312c893b43702faa8b16471766f5fd91dd165348454121a6061ae1adf8320549e280b5a6ded4573')
b2sums=('2cf1c8df7569676f3d0677f381d04e4a7bedca4f03fd3bea6307fc2651af5e6528c41bc6911e770719445ad305525ab795535dd64780408d7589b53f24229da6'
        'a5a7abb1fcc1b4fef35babb69152735ffbcebadc288db5af604af4872a0d7e4f12a76d83168412c05d8c7d70dd6a4a1a18ccc4c81a9dabb6b314c856c4f1fc4a')

prepare() {
  # Python 3.12 support for versioneer script
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-3.3.0-versioneer_configparser.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
