# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Giovanni Harting <539@idlegandalf.com>

pkgname=python-awesomeversion
_name=${pkgname#python-}
pkgver=24.2.0
pkgrel=2
pkgdesc="One version package to rule them all."
arch=('any')
url="https://github.com/ludeeus/awesomeversion"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=('python-pytest' 'python-pytest-snapshot')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ludeeus/$_name/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('d4dce1d016219a012184824c47b46aea803a702b6d2198ace2da66a3ad2fcc2efeeca347c7611ff16e2ddb4d2a15fae7fa0623b035247f2632892b07a470ca19')

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
