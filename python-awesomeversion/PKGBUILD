# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Giovanni Harting <539@idlegandalf.com>

pkgname=python-awesomeversion
_name=${pkgname#python-}
pkgver=23.8.0
pkgrel=1
pkgdesc="One version package to rule them all."
arch=('any')
url="https://github.com/ludeeus/awesomeversion"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ludeeus/$_name/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('31761a12e7c8192deb91873dac2e76b4a89389d67a1aa901d543dd14d89a1e06463eb0b200326d9e9e1a4c3618a26f159b63d1559210e7c0abb60f5df18f21cd')

prepare() {
    cd $_name-$pkgver
    # version = "0"
    sed -e "s|version = \"0\"|version = \"$pkgver\"|" -i pyproject.toml
}

check() {
    cd $_name-$pkgver
    PYTHONPATH=. pytest tests
}

build() {
    cd $_name-$pkgver

    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
