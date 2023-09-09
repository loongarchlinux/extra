# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_name=mutagen
pkgname=python-mutagen
pkgver=1.47.0
pkgrel=1
arch=(any)
pkgdesc="An audio metadata tag reader and writer (python library)"
url="https://github.com/quodlibet/mutagen"
license=(GPL-2.0-or-later)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pycodestyle
  python-pyflakes
  python-pytest
)
source=($url/releases/download/release-$pkgver/$_name-$pkgver.tar.gz{,.sig})
sha512sums=('40f9a8a898c9fdae00fd0bdd38eb91a6fb813cf8319f888590bdfd4b5efcb614aa5322c0b9e017f49c3f5155ccf82d5cae80aad79df285c50b5ef270c09f4c9d'
            'SKIP')
b2sums=('220d8e136e8f41d2f3953ce61b4784a24b1e450b6cfe0d0e0c610aeccb9ff3248493b8a0ea78f801e62b2f6ac87cd219a05cff535e04586a5ce9b03aa3540278'
        'SKIP')
validpgpkeys=('0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC') # Christoph Reiter <reiter.christoph@gmail.com>

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -v --ignore tests/quality/test_flake8.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {NEWS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
