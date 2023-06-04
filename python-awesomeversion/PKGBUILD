# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Giovanni Harting <539@idlegandalf.com>

pkgname=python-awesomeversion
_name=${pkgname#python-}
pkgver=23.5.0
pkgrel=1
pkgdesc="One version package to rule them all."
arch=('any')
url="https://github.com/ludeeus/awesomeversion"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ludeeus/$_name/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('cabb6860795d9ad1d813879fc129a7808463b8c466078cdc546f8235c7efa6da7b70b834098f7909ab3f5d45d7d5cf9a3edfa1ad254c3771008ca970be01cf1a')

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
